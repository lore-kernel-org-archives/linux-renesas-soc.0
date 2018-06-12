Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:48966 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933545AbeFLC1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 22:27:10 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: RE: [PATCH 1/3] arm64: dts: renesas: convert to SPDX identifiers
Date: Tue, 12 Jun 2018 02:27:05 +0000
Message-ID: <OSBPR01MB2293324289A8C59EB59CB906D87F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
 <20180611144937.9554-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180611144937.9554-2-wsa+renesas@sang-engineering.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Monday, June 11, 2018 11:50 PM
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts  | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts     | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi           | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts      | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts         | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts    | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi               | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts      | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts         | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts     | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts    | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi               | 5 +----

I tried to apply this patch on renesas-devel-20180608-v4.17 and
this r8a7796 cannot be applied because conflict happened.
So, I guess you need rebase. After rebased:

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 5 +----
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts         | 5 +----
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi              | 5 +----
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts         | 5 +----
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi              | 5 +----
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi       | 5 +----
>  arch/arm64/boot/dts/renesas/salvator-x.dtsi            | 5 +----
>  arch/arm64/boot/dts/renesas/salvator-xs.dtsi           | 5 +----
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi               | 5 +----
>  arch/arm64/boot/dts/renesas/ulcb.dtsi                  | 5 +----
>  24 files changed, 24 insertions(+), 96 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> index 009cb1cb0dde..2f24dfc45617 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the H3ULCB Kingfisher board
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include "r8a7795-es1-h3ulcb.dts"
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts b/arch/ar=
m64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
> index dd4f9b6a4254..598b98168559 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
> index 3f46345a4644..6b5fa91f1d5d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X board with R-Car H3 ES1.x
>   *
>   * Copyright (C) 2015 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/bo=
ot/dts/renesas/r8a7795-es1.dtsi
> index e19dcd6cb767..fde3e84626d7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the r8a7795 ES1.x SoC
>   *
>   * Copyright (C) 2015 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include "r8a7795.dtsi"
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts b/arch/arm=
64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> index 4403227c0f97..80791ed27539 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the H3ULCB Kingfisher board
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include "r8a7795-h3ulcb.dts"
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/=
boot/dts/renesas/r8a7795-h3ulcb.dts
> index 0afe777973de..df50bf46406e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/ar=
m64/boot/dts/renesas/r8a7795-salvator-x.dts
> index 0efbef5ea9b7..446822f5751c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X board with R-Car H3 ES2.0
>   *
>   * Copyright (C) 2015 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/a=
rm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> index e231b5a7cbab..8ded64d0a4d5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X 2nd version board with R-Car H3=
 ES2.0
>   *
>   * Copyright (C) 2015-2017 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/d=
ts/renesas/r8a7795.dtsi
> index 7f66faad565d..ebfb9f62b552 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the r8a7795 SoC
>   *
>   * Copyright (C) 2015 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts b/arch/arm=
64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> index de2390f009e7..2df50eb11f16 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the M3ULCB Kingfisher board
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include "r8a7796-m3ulcb.dts"
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/=
boot/dts/renesas/r8a7796-m3ulcb.dts
> index daee1f1a3f68..cbd8acbf537e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/ar=
m64/boot/dts/renesas/r8a7796-salvator-x.dts
> index 90cca09b9a5e..052d72acc862 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X board with R-Car M3-W
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/a=
rm64/boot/dts/renesas/r8a7796-salvator-xs.dts
> index ddf35d4cd5e5..8860be65342e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X 2nd version board with R-Car M3=
-W
>   *
>   * Copyright (C) 2015-2017 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/d=
ts/renesas/r8a7796.dtsi
> index 85169239b606..b4957ab336c7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the r8a7796 SoC
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-eagle.dts
> index 21f9cf5c6e84..b6d53321576b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Eagle board
>   *
>   * Copyright (C) 2016-2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-v3msk.dts
> index 9fce031a596f..8eac8ca6550b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the V3M Starter Kit board
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77970.dtsi
> index c8464d1ef1b2..a949cee2eda4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the r8a77970 SoC
>   *
>   * Copyright (C) 2016-2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include <dt-bindings/clock/r8a77970-cpg-mssr.h>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/=
boot/dts/renesas/r8a77995-draak.dts
> index 9d73de8bc94d..0a11d611207d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Draak board
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2017 Glider bvba
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /dts-v1/;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77995.dtsi
> index 2506f46293e8..c964650fabe5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the r8a77995 SoC
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2017 Glider bvba
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include <dt-bindings/clock/r8a77995-cpg-mssr.h>
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index 9256fbaaab7f..313e36beaf5c 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for common parts of Salvator-X board variants
>   *
>   * Copyright (C) 2015-2016 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  /*
> diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boo=
t/dts/renesas/salvator-x.dtsi
> index 468868c8ed9f..f7091ecb02f9 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X board
>   *
>   * Copyright (C) 2015-2016 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include "salvator-common.dtsi"
> diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/bo=
ot/dts/renesas/salvator-xs.dtsi
> index bf4d200fb546..8b139d93488f 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Salvator-X 2nd version board
>   *
>   * Copyright (C) 2015-2017 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include "salvator-common.dtsi"
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/d=
ts/renesas/ulcb-kf.dtsi
> index a4e715cbde87..8bf3091a899c 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the Kingfisher (ULCB extension) board
>   *
>   * Copyright (C) 2017 Renesas Electronics Corp.
>   * Copyright (C) 2017 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  / {
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/=
renesas/ulcb.dtsi
> index 0edb16e6b372..219ad06edfc7 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -1,12 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Device Tree Source for the R-Car Gen3 ULCB board
>   *
>   * Copyright (C) 2016 Renesas Electronics Corp.
>   * Copyright (C) 2016 Cogent Embedded, Inc.
> - *
> - * This file is licensed under the terms of the GNU General Public Licen=
se
> - * version 2.  This program is licensed "as is" without any warranty of =
any
> - * kind, whether express or implied.
>   */
>=20
>  #include <dt-bindings/gpio/gpio.h>
> --
> 2.11.0
