# Interfaces
class Chair
  def has_legs?
    true
  end

  def sit_on
    'You sit on a chair'
  end
end

class Sofa
end

class Table
end

# Concrete Products

class VictorianChair < Chair
end

class VictorianSofa < Sofa
end

class VictorianTable < Table
end

class ModernChair < Chair
end

class ModernSofa < Sofa
end

class ModernTable < Table
end

# ... and so on for the rest of the furniture.

# Factory Interface
class FurnitureFactory
  def create_chair
    raise NotImplementedError
  end

  def create_sofa
    raise NotImplementedError
  end

  def create_table
    raise NotImplementedError
  end
end

# concrete Factories

class VictorianFurnitureFactory < FurnitureFactory
  def create_chair
    VictorianChair.new
  end

  def create_sofa
    VictorianSofa.new
  end

  def create_table
    VictorianTable.new
  end

  # ... other methods
end

class ModernFurnitureFactory < FurnitureFactory
  # ... same as VictorianFurnitureFactory
end
