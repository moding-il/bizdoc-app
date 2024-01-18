# BizDoc

Workflow app on top of enterprise data analysis.

## Libraries

* Business-Trip [NuGet](https://www.nuget.org/packages/BizDoc.Applications.Business-Trip/) [npm](https://www.npmjs.com/package/@bizdoc-apps/business-trip)

* Priority [NuGet](https://www.nuget.org/packages/BizDoc.Infrastructure.Priority) [npm](https://www.npmjs.com/@bizdoc/priority)

* MFG/PRO [NuGet](https://www.nuget.org/packages/BizDoc.Infrastructure.Mfg) [npm](https://www.npmjs.com/@bizdoc/mfg)

* Slack [NuGet](https://www.nuget.org/packages/BizDoc.Social.Slack) 

* Teams [NuGet](https://www.nuget.org/packages/BizDoc.Social.Teams) [npm](https://www.npmjs.com/@bizdoc/teams)

* Okta [NuGet](https://www.nuget.org/packages/BizDoc.Authentication.Okta) [npm](https://www.npmjs.com/@bizdoc/okta)

* Directory Services [NuGet](https://www.nuget.org/packages/BizDoc.Authentication.DirectoryServices) [npm](https://www.npmjs.com/@bizdoc/windows)

* Azure [NuGet](https://www.nuget.org/packages/BizDoc.Authentication.Azure) [npm](https://www.npmjs.com/@bizdoc/azure)

* G-Suite [NuGet](https://www.nuget.org/packages/BizDoc.Authentication.G-Suite) [npm](https://www.npmjs.com/@bizdoc/g-suite)

* Survey [NuGet](https://www.nuget.org/packages/BizDoc.Infrastructure.Survey) [npm](https://www.npmjs.com/@bizdoc/survey)

* Monday.com [NuGet](https://www.nuget.org/packages/BizDoc.Infrastructure.Monday) [npm](https://www.npmjs.com/@bizdoc/monday)

## Server-side

Create components.

```cs
using BizDoc.Core.Components;
using BizDoc.Core.Components.Annotations;

[Widget(Title = "My Widget", Template = "my-widget")]
public class MyWidget: WidgetBase {

  public override Task<Item[]> GetAsync(Args args) {
    // ...
  }
}
```

[Components](https://github.com/moding-il/bizdoc.core/wiki/Core-Components).

#### Database

SQL Server or [Oracle](https://www.nuget.org/packages/BizDoc.Storage.Oracle) configured in _program.cs_.

#### Configuration

_bizdoc.json_ file on root folder is self-maintained on project run.

## Angular

```ts
import { BizDoc, WidgetComponent } from '@bizdoc/core';

@BizDoc({
  selector: 'my-widget'
})
export class MyWidget implements WidgetComponent<Item[]> {
  onBind(data: Item[]) {
    // ...
  }
}
```

#### Resources

[Angular Material](https://material.angular.io/)

[RxJs](https://rxjs.dev/)

## Flutter

Mobile app.

```dart
class _MyComponentState extends State<MyComponent> {
  late BizDocFormState _state;
  late MyModel _model;
  @override initState() {
    _state = Provider.of<BizDocFormState>(context, listen: false);
    _model = MyModel(_state.data);
    super.initState();
  }
}
```

[pub.dev](https://pub.dev/packages/bizdoc)

## More Help

[wiki](https://github.com/moding-il/bizdoc.core/wiki)
