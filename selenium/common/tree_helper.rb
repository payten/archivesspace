module TreeHelperMethods

  class Node
    def initialize(obj)
      @obj = obj
    end

    def tree_id
      "#{@obj.jsonmodel_type}_#{@obj.class.id_for(@obj.uri)}"
    end

    def li_selector
      "##{tree_id}.largetree-node"
    end

    def a_selector
      "#{li_selector} a.record-title"
    end

  end

  def tree_drag_and_drop(source, target)
    y_off = target.location[:y] - source.location[:y]

    @driver.action.drag_and_drop_by(source, 0, y_off).perform
    @driver.wait_for_spinner

  end

  def tree_node(obj)
    Node.new(obj)
  end

  def tree_click(node)
    @driver.find_element(:css => node.a_selector).click
  end

  def check_tree_node_for_title(title)
    @driver.find_element_with_text('//div[@id="tree-container"]//tr', /#{title}/)
  end
end
