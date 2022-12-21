
public protocol App {
	associatedtype Body: Scene
	var body: Body { get }

	init()

	static func main()
}

extension App {
	public init() { self.init() }

	public static func main() {
		let app = Self()

		print(app.body)
	}
}

public protocol Scene {
	associatedtype Body: Scene
	var body: Body { get }
}

internal struct PlaceholderScene: Scene {
	var body: some Scene { PlaceholderScene() }
}

public struct WindowGroup<Content: View>: Scene {
	public init(_ content: () -> Content) {}
	public var body: some Scene { PlaceholderScene() }
}

public protocol View {
	associatedtype Body: View
	@ViewBuilder var body: Body { get }

	func modifier<T: ViewModifier>(_ modifier: T) -> ModifiedContent<Self, T>
}

extension View {
	public var body: some View { EmptyView() }
	public func modifier<T: ViewModifier>(_ modifier: T) -> ModifiedContent<Self, T> { ModifiedContent(self, modifier) }
}

public struct TupleView<T>: View {
	public init(_ t: T) {}
}

@resultBuilder
public struct ViewBuilder {
	public static func buildBlock() -> EmptyView { EmptyView() }
	public static func buildBlock<Content: View>(_ content: Content) -> Content { content }
	public static func buildBlock<C0: View, C1: View>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)>  {
		TupleView((c0, c1))
	}
	public static func buildBlock<C0: View, C1: View, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)>  {
		TupleView((c0, c1, c2))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleView<(C0, C1, C2, C3)>  {
		TupleView((c0, c1, c2, c3))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleView<(C0, C1, C2, C3, C4)>  {
		TupleView((c0, c1, c2, c3, c4))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleView<(C0, C1, C2, C3, C4, C5)>  {
		TupleView((c0, c1, c2, c3, c4, c5))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)>  {
		TupleView((c0, c1, c2, c3, c4, c5, c6))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>  {
		TupleView((c0, c1, c2, c3, c4, c5, c6, c7))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>  {
		TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8))
	}
	public static func buildBlock<C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>  {
		TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9))
	}

	public static func buildEither<TrueContent: View>(first component: TrueContent) -> AnyView { AnyView(component) }
	public static func buildEither<FalseContent: View>(second component: FalseContent) -> AnyView { AnyView(component) }

	public static func buildIf<Content: View>(_ content: Content?) -> some View {
		if content == nil { return AnyView(EmptyView())}
		return AnyView(content!)
	}
}

public struct ShapeStyle {
	public static var quaternary: ShapeStyle { ShapeStyle() }
}

public struct Font {
	public enum FontWeight {
		case regular
	}

	public enum FontDesign {
		case regular
		case rounded
	}

	public static func system(size: CGFloat, weight: FontWeight, design: FontDesign) -> Font { Font() }
}

public struct IndexViewStyle {
	public enum IndexBackgroundDisplayMode {
		case interactive
		case never
	}
	public static func page(backgroundDisplayMode: IndexBackgroundDisplayMode) -> Self { Self() }
}

public struct Angle {
	public static func degrees(_ deg: CGFloat) -> Angle { Angle() }
	public static func radiants(_ deg: CGFloat) -> Angle { Angle() }
}

public enum LabelStyle {
	case automatic
	case iconOnly
	case titleAndIcon
	case titleOnly
}

public enum NavigationViewStyle {
	case stack
	case columns
}

public enum TabViewStyle {
	case automatic
	case carousel
	case page
}

public struct UnitPoint {
	public static var zero: UnitPoint { UnitPoint() }
	public static var topLeading: UnitPoint { UnitPoint() }
	public static var top: UnitPoint { UnitPoint() }
	public static var topTrailing: UnitPoint { UnitPoint() }
	public static var leading: UnitPoint { UnitPoint() }
	public static var center: UnitPoint { UnitPoint() }
	public static var trailing: UnitPoint { UnitPoint() }
	public static var bottomLeading: UnitPoint { UnitPoint() }
	public static var bottom: UnitPoint { UnitPoint() }
	public static var bottomTrailing: UnitPoint { UnitPoint() }
}

public struct Alignment {
	public static var topLeading: Alignment { Alignment() }
	public static var top: Alignment { Alignment() }
	public static var topTrailing: Alignment { Alignment() }
	public static var leading: Alignment { Alignment() }
	public static var center: Alignment { Alignment() }
	public static var trailing: Alignment { Alignment() }
	public static var bottomLeading: Alignment { Alignment() }
	public static var bottom: Alignment { Alignment() }
	public static var bottomTrailing: Alignment { Alignment() }
}

public enum TitleDisplayMode {
	case automatic
	case inline
	case large
}

public struct ToolbarItemPlacement {
	public static var automatic: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var principal: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var status: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var primaryAction: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var secondaryAction: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var confirmationAction: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var cancellationAction: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var destructiveAction: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var navigation: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var navigationBarLeading: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var navigationBarTrailing: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var keyboard: ToolbarItemPlacement { ToolbarItemPlacement() }
	public static var bottomBar: ToolbarItemPlacement { ToolbarItemPlacement() }
}

public struct EdgeInsets {
	public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {}
}

public enum Edge {
	case top
	case bottom
	case leading
	case trailing

	public struct Set {
		public static var top: Self { Set() }
		public static var bottom: Self { Set() }
		public static var leading: Self { Set() }
		public static var trailing: Self { Set() }
		public static var horizontal: Self { Set() }
		public static var vertical: Self { Set() }
		public static var all: Self { Set() }
	}
}

public struct EmptyView: View {
	public init() {}
}

public typealias CGFloat = Double

public extension CGFloat {
	init(_ float: Double) {self = float}
}

public struct UUID: Hashable {
	public init() {}
}

public struct UIColor {
	public static var secondarySystemBackground: UIColor { UIColor() }
	public static var tertiarySystemBackground: UIColor { UIColor() }
}

public struct Color: View {
	public init() {}
	public init(_ uicolor: UIColor) {}

	public func opacity(_ value: CGFloat) -> Color { Color() }
}

public extension Color {
	static var black: Color { Color() }
	static var blue: Color { Color() }
	static var brown: Color { Color() }
	static var clear: Color { Color() }
	static var cyan: Color { Color() }
	static var gray: Color { Color() }
	static var green: Color { Color() }
	static var indigo: Color { Color() }
	static var mint: Color { Color() }
	static var orange: Color { Color() }
	static var pink: Color { Color() }
	static var purple: Color { Color() }
	static var red: Color { Color() }
	static var teal: Color { Color() }
	static var white: Color { Color() }
	static var yellow: Color { Color() }
	
	static var accentColor: Color { Color() }
	static var primary: Color { Color() }
	static var secondary: Color { Color() }
}

public struct VerticalAlignment {
	public static var top: VerticalAlignment { VerticalAlignment() }
	public static var center: VerticalAlignment { VerticalAlignment() }
	public static var bottom: VerticalAlignment { VerticalAlignment() }
	public static var firstTextBaseline: VerticalAlignment { VerticalAlignment() }
	public static var lastTextBaseline: VerticalAlignment { VerticalAlignment() }
}

public struct HorizontalAlignment {
	public static var leading: HorizontalAlignment { HorizontalAlignment() }
	public static var center: HorizontalAlignment { HorizontalAlignment() }
	public static var trailing: HorizontalAlignment { HorizontalAlignment() }
	public static var listRowSeparatorLeading: HorizontalAlignment { HorizontalAlignment() }
	public static var listRowSeparatorTrailing: HorizontalAlignment { HorizontalAlignment() }
}

@propertyWrapper
public struct State<Value> {
	internal var _wrappedValue: Value
	public var wrappedValue: Value {
		get {_wrappedValue}
		nonmutating set {}
	}

	public var projectedValue: Binding<Value> { Binding(value: wrappedValue) }

	public init(wrappedValue value: Value) { self._wrappedValue = value }
	public init(initialValue value: Value) { self._wrappedValue = value }
}

@propertyWrapper
public struct StateObject<Value: ObservableObject> {
	public var wrappedValue: Value

	public var projectedValue: ObservedObject<Value> { ObservedObject(wrappedValue: wrappedValue) }

	public init(wrappedValue value: Value) { self.wrappedValue = value }
}

@propertyWrapper
public struct ObservedObject<Value: ObservableObject> {
	internal var _wrappedValue: Value
	public var wrappedValue: Value { get {_wrappedValue} nonmutating set {} }

	public var projectedValue: ObservedObject<Value> { ObservedObject(wrappedValue: wrappedValue) }

	public init(wrappedValue value: Value) { self._wrappedValue = value }
}

@propertyWrapper
public struct Binding<Value> {
	internal var _wrappedValue: Value
	public var wrappedValue: Value { 
		get { _wrappedValue }
		nonmutating set {}
	}

	public var projectedValue: Binding<Value> { self }

	public init(projectedValue base: Binding<Value>) { self._wrappedValue = base._wrappedValue }
	public init(_ base: Binding<Value>) { self._wrappedValue = base._wrappedValue }
	public init?(_ base: Binding<Value?>) { if base._wrappedValue == nil { return nil } ; self._wrappedValue = base._wrappedValue! }
	public init<V>(_ base: Binding<V>) where Value == V? { self._wrappedValue = base._wrappedValue }

	public init(value: Value) { self._wrappedValue = value}

	public static func constant(_ value: Value) -> Self { Binding(value: value) }
}

@propertyWrapper
public struct EnvironmentObject<Value: ObservableObject> {
	internal var _wrappedValue: Value? = nil

	public var wrappedValue: Value {
		get {_wrappedValue!}
		set {_wrappedValue = newValue}
	} 

	public var projectedValue: EnvironmentObject<Value> { self }

	public init(wrappedValue value: Value) { self.wrappedValue = value }
	public init() {}
}

@propertyWrapper
public struct Published<Value> {
	public var wrappedValue: Value

	public var projectedValue: Published<Value> { self }

	public init(wrappedValue value: Value) { self.wrappedValue = value }
}

@propertyWrapper
public struct Namespace {
	public var wrappedValue: String

	public init() { self.wrappedValue = "" }
}

@propertyWrapper
public struct Environment<Value> {
	internal var keyPath: KeyPath<EnvironmentValues, Value>
	public var wrappedValue: Value {
		EnvironmentValues()[keyPath: keyPath]
	}

	public init(_ keyPath: KeyPath<EnvironmentValues, Value>) { self.keyPath = keyPath }
}

public struct EnvironmentValues {
	public enum UserInterfaceSizeClass {
		case compact
		case regular
	}
	public var horizontalSizeClass: UserInterfaceSizeClass?
}

public protocol ObservableObject: AnyObject {}

public struct AnyView: View {
	public init<Content: View>(_ view: Content) {}
}

public struct Text: View {
	public init<Str: StringProtocol>(_ text: Str) {}
}

public struct HStack<Content: View>: View {
	public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {}
}

public struct VStack<Content: View>: View {
	public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {}
}

public struct ForEach<Content: View>: View {
	public init(_ data: Range<Int>, @ViewBuilder content: (Int) -> Content) {}
	public init<Data: RandomAccessCollection>(_ data: Data, @ViewBuilder content: (Data.Element) -> Content) where Data.Element: Identifiable {}
	public init<Data: RandomAccessCollection, ID: Hashable>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: (Data.Element) -> Content) {}
}

public struct List<Content: View>: View {
	public init(@ViewBuilder content: () -> Content) {}
	public init<Data: RandomAccessCollection>(_ data: Data, @ViewBuilder content: (Data.Element) -> Content) where Data.Element: Identifiable {}
	public init<Data: RandomAccessCollection, ID: Hashable>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: (Data.Element) -> Content) {}
}

public struct NavigationView<Content: View>: View {
	public init(@ViewBuilder content: () -> Content) {}
}

public struct NavigationLink<Content: View>: View {
	public init<Str: StringProtocol>(_ label: Str, @ViewBuilder content: () -> Content) {}
	public init<Label: View>(@ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label) {}
}

public struct ToolbarItem<Content: View>: View {
	public init(placement: ToolbarItemPlacement = .navigationBarLeading, @ViewBuilder content: () -> Content) {}
}

public struct ToolbarItemGroup<Content: View>: View {
	public init(placement: ToolbarItemPlacement = .navigationBarLeading, @ViewBuilder content: () -> Content) {}
}

public struct Button: View {
	public init<Str: StringProtocol>(_ label: Str, action: () -> Void) {}
	public init<Label: View>(action: () -> Void, @ViewBuilder label: () -> Label) {}
}

public struct Toggle: View {
	public init<Str: StringProtocol>(_ label: Str, isOn: Binding<Bool> = .constant(true)) {}
	public init<Label: View>(action: () -> Void, @ViewBuilder label: () -> Label) {}
}

public typealias Divider = EmptyView

public struct Spacer: View {
	public init(minLength: CGFloat? = nil) {}
}

public typealias Rectangle = EmptyView
public typealias Capsule = EmptyView

public struct TabView<Content: View>: View {
	public init(@ViewBuilder content: () -> Content) {}
}

public struct Image: View {
	public init(_ name: String) {}
	public init(systemName name: String) {}
}

public struct Label: View {
	public init(_ name: String, systemImage: String) {}
	public init(_ name: String, image: String) {}
}

public struct ScrollViewProxy {
	public func scrollTo<Id: Hashable>(_ id: Id) {}
}

public struct ScrollViewReader<Content: View>: View {
	public init(@ViewBuilder content: (ScrollViewProxy) -> Content) {}
}

public struct CGSize {
	public var width: CGFloat = 0
	public var height: CGFloat = 0
}

public struct GeometryProxy {
	public var size: CGSize
}

public struct GeometryReader<Content: View>: View {
	public init(@ViewBuilder content: (GeometryProxy) -> Content) {}
}

public struct ScrollView<Content: View>: View {
	public init(@ViewBuilder content: () -> Content) {}
}

public protocol PreviewProvider {
	associatedtype Previews: View
	static var previews: Previews { get }
}

public struct Animation {
	public static var `default`: Animation { Animation() }
	public static var linear: Animation { Animation() }
	public static var easeIn: Animation { Animation() }
	public static var easeOut: Animation { Animation() }
	public static var easeInOut: Animation { Animation() }

	public static func linear(duration: Double) -> Animation { Animation() }
	public static func easeIn(duration: Double) -> Animation { Animation() }
	public static func easeOut(duration: Double) -> Animation { Animation() }
	public static func easeInOut(duration: Double) -> Animation { Animation() }
}

public func withAnimation(_ animation: Animation? = .default, exec: () throws -> Void) rethrows {}

