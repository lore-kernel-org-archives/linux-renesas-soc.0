Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38255 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751583AbeAASMM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Jan 2018 13:12:12 -0500
Date: Mon, 1 Jan 2018 10:12:07 -0800
From: Eduardo Valentin <edubezval@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [1/2] arm64: dts: r8a7795: add thermal cooling management
Message-ID: <20180101181204.GA3567@localhost.localdomain>
References: <20170913105909.13230-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20170913105909.13230-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 12:59:08PM +0200, Niklas S=F6derlund wrote:
> Add nodes and properties for thermal cooling management support.
>=20
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Eduardo Valentin <edubezval@gmail.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 40 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/d=
ts/renesas/r8a7795.dtsi
> index 0ccac86bccc6b6f0..1818fd20660d0315 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -53,6 +53,7 @@
>  				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
>  				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
>  				<&cluster0_opp_tb7>;
> +			#cooling-cells =3D <2>;
>  		};
> =20
>  		a57_1: cpu@1 {
> @@ -67,6 +68,7 @@
>  				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
>  				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
>  				<&cluster0_opp_tb7>;
> +			#cooling-cells =3D <2>;
>  		};
> =20
>  		a57_2: cpu@2 {
> @@ -81,6 +83,7 @@
>  				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
>  				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
>  				<&cluster0_opp_tb7>;
> +			#cooling-cells =3D <2>;
>  		};
> =20
>  		a57_3: cpu@3 {
> @@ -95,6 +98,7 @@
>  				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
>  				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
>  				<&cluster0_opp_tb7>;
> +			#cooling-cells =3D <2>;
>  		};
> =20
>  		a53_0: cpu@100 {
> @@ -2821,12 +2825,24 @@
>  				thermal-sensors =3D <&tsc 0>;
> =20
>  				trips {
> +					sensor1_passive: sensor1-passive {
> +						temperature =3D <95000>;
> +						hysteresis =3D <2000>;
> +						type =3D "passive";
> +					};
>  					sensor1_crit: sensor1-crit {
>  						temperature =3D <120000>;
>  						hysteresis =3D <2000>;
>  						type =3D "critical";
>  					};
>  				};
> +
> +				cooling-maps {
> +					map0 {
> +						trip =3D <&sensor1_passive>;
> +						cooling-device =3D <&a57_0 4 4>;
> +					};
> +				};
>  			};
> =20
>  			sensor_thermal2: sensor-thermal2 {
> @@ -2835,12 +2851,24 @@
>  				thermal-sensors =3D <&tsc 1>;
> =20
>  				trips {
> +					sensor2_passive: sensor2-passive {
> +						temperature =3D <95000>;
> +						hysteresis =3D <2000>;
> +						type =3D "passive";
> +					};
>  					sensor2_crit: sensor2-crit {
>  						temperature =3D <120000>;
>  						hysteresis =3D <2000>;
>  						type =3D "critical";
>  					};
>  				};
> +
> +				cooling-maps {
> +					map0 {
> +						trip =3D <&sensor2_passive>;
> +						cooling-device =3D <&a57_0 4 4>;
> +					};
> +				};
>  			};
> =20
>  			sensor_thermal3: sensor-thermal3 {
> @@ -2849,12 +2877,24 @@
>  				thermal-sensors =3D <&tsc 2>;
> =20
>  				trips {
> +					sensor3_passive: sensor3-passive {
> +						temperature =3D <95000>;
> +						hysteresis =3D <2000>;
> +						type =3D "passive";
> +					};
>  					sensor3_crit: sensor3-crit {
>  						temperature =3D <120000>;
>  						hysteresis =3D <2000>;
>  						type =3D "critical";
>  					};
>  				};
> +
> +				cooling-maps {
> +					map0 {
> +						trip =3D <&sensor3_passive>;
> +						cooling-device =3D <&a57_0 4 4>;
> +					};
> +				};
>  			};
>  		};
>  	};
