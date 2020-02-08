require "byebug"

class PolyTreeNode

        def initialize (value)
            @value=value
            @parent=nil
            @children=[]
        end

        def parent
            @parent
        end
        
        def children
            @children
        end

        def value
            @value
        end

        #  (1) sets the parent property and 
        #  (2) adds the node to their parent's array of children 
        #  (unless we're setting parent to nil).

        def parent=(node)
            if node.nil?
                @parent=nil
            else
                @parent.children.reject! {|child| child==self} if @parent!=nil 
                @parent=node
                node.children << self
            end

        end

        def add_child (node)
            node.parent=self

        end

        def remove_child (child_node)
            #child_node.parent.children
            raise "Not a valid child" if child_node.parent == nil
            child_node.parent=nil
        end
# bundle exec rspec spec/00_tree_node_spec.rb:97

        def dfs(target_value)
          return self if self.value == target_value
          if @children.any?
            
            @children.each do |child| 
                
                 actual_child=child.dfs(target_value)
                if  actual_child!= nil
                    return actual_child
                end
            end
          else
            return nil
          end
          nil
        end

        def bfs (target_value)
            arr=[self]
            while arr.length > 0
                # debugger
                node=arr.shift
                if node.value==target_value
                    return node
                else
                    arr+=node.children
                end

            end

            nil
        end
end