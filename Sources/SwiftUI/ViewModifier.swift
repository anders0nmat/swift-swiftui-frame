public protocol ViewModifier {
	associatedtype Body: View
	func body<Content: View>(content: Content) -> Body
}

public struct EmptyModifier: ViewModifier {
	public typealias Body = EmptyView
	public func body<Content: View>(content: Content) -> Body { EmptyView() }
}

extension ViewModifier {
	internal var noModifier: some ViewModifier { EmptyModifier() }
}

public struct ModifiedContent<Content: View, Modifier: ViewModifier>: View {
	public init(_ content: Content, _ modifier: Modifier) {}
}

public extension View {
	func padding(_ length: CGFloat) -> some View { modifier(EmptyModifier()) }
	func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View { modifier(EmptyModifier()) }
	func padding(_ insets: EdgeInsets) -> some View { modifier(EmptyModifier()) }

	func navigationBarTitleDisplayMode(_ displayMode: TitleDisplayMode) -> some View { modifier(EmptyModifier()) }

	func navigationTitle<Str: StringProtocol>(_ title: Str) -> some View { modifier(EmptyModifier()) }

	func toolbar<Content: View>(@ViewBuilder content: () -> Content) -> some View { modifier(EmptyModifier()) }

	func scaleEffect(_ value: CGFloat, anchor: UnitPoint = .center) -> some View { modifier(EmptyModifier()) }

	func tabItem<Content: View>(@ViewBuilder content: () -> Content) -> some View { modifier(EmptyModifier()) }

	func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View { modifier(EmptyModifier())}
	func frame(
		minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil,
		minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View { modifier(EmptyModifier())}

	func background<Content: View>(@ViewBuilder content: () -> Content) -> some View { modifier(EmptyModifier()) }
	func background<Content: View>(_ content: @autoclosure () -> Content) -> some View { modifier(EmptyModifier()) }
	func background(_ style: ShapeStyle) -> some View { modifier(EmptyModifier()) }
	func background(_ color: Color) -> some View { modifier(EmptyModifier()) }

	func fill(_ color: Color) -> some View { modifier(EmptyModifier()) }

	func overlay<Content: View>(alignment: Alignment = .center, @ViewBuilder content: () -> Content) -> some View { modifier(EmptyModifier()) }

	func sheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View { modifier(EmptyModifier()) }
	func fullScreenCover<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View { modifier(EmptyModifier()) }

	func cornerRadius(_ radius: CGFloat) -> some View { modifier(EmptyModifier()) }
	func minimumScaleFactor(_ radius: CGFloat) -> some View { modifier(EmptyModifier()) }

	func tabViewStyle(_ style: TabViewStyle) -> some View { modifier(EmptyModifier()) }

	func opacity(_ value: CGFloat) -> some View { modifier(EmptyModifier()) }

	func foregroundColor(_ color: Color) -> some View { modifier(EmptyModifier()) }

	func border(_ color: Color) -> some View { modifier(EmptyModifier()) }

	func clipped() -> some View { modifier(EmptyModifier()) }
	func clipShape<Content: View>(_ content: @autoclosure () -> Content) -> some View { modifier(EmptyModifier()) }

	func environmentObject(_ object: ObservableObject) -> some View { modifier(EmptyModifier()) }

	func onChange<Value: Equatable>(of: Value, action: (Value) -> Void) -> some View { modifier(EmptyModifier()) }

	func navigationViewStyle(_ style: NavigationViewStyle) -> some View { modifier(EmptyModifier()) }

	func navigationBarHidden(_ bool: Bool) -> some View { modifier(EmptyModifier()) }
	func disabled(_ bool: Bool) -> some View { modifier(EmptyModifier()) }

	func labelStyle(_ style: LabelStyle) -> some View { modifier(EmptyModifier())}

	func lineLimit(_ lines: Int) -> some View { modifier(EmptyModifier()) }
	func layoutPriority(_ lines: Int) -> some View { modifier(EmptyModifier()) }

	func rotationEffect(_ angle: Angle) -> some View { modifier(EmptyModifier()) }

	func indexViewStyle(_ style: IndexViewStyle) -> some View { modifier(EmptyModifier()) }

	func font(_ font: Font) -> some View { modifier(EmptyModifier()) }
}
