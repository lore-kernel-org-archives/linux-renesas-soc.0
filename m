Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48216 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935633AbeFNBmf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 21:42:35 -0400
Date: Thu, 14 Jun 2018 10:42:30 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: convert to SPDX identifiers
Message-ID: <20180614014229.udh4gbl7iqw3nvl5@ninjato>
References: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
 <20180611144937.9554-2-wsa+renesas@sang-engineering.com>
 <OSBPR01MB2293324289A8C59EB59CB906D87F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20180613111228.csaxbkfz5t2upkyd@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kjej36qishmfzyvg"
Content-Disposition: inline
In-Reply-To: <20180613111228.csaxbkfz5t2upkyd@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kjej36qishmfzyvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

> I applied this by hand, resolving the conflict in r8a7796.dtsi.

Thanks for doing this Simon.

> The result is below. Wolfram, please check it.

I am afraid there is something missing, though...

>  arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts    | 5 +----
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi               | 4 ----
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 5 +----

See the broken pattern in the diffstat?

> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 2a04635bc9ae..03319d008ba1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -2,10 +2,6 @@
>   * Device Tree Source for the r8a7796 SoC
>   *
>   * Copyright (C) 2016-2017 Renesas Electronics Corp.
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2.  This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
>   */

The actual SPDX identifier like this

> +// SPDX-License-Identifier: GPL-2.0

got accidently dropped.

Kind regards,

   Wolfram


--kjej36qishmfzyvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlshyAEACgkQFA3kzBSg
KbbPUw/6Ag8s/Q4zS+PSlS6++hyaK58XszZ5VjZAbvScB2OPK9d0piOb8VUzw7Fw
8YAcoef/yChXayDcB4whrf9aKnBEPxojfPpzkFmtnK4sxKXDT/CSgY1taC6ERa+n
aGeUool3/9JAw0u4VxOnjGKQhwFsyN4hHX5+SIwYVoFEBn7wCPT7BvC1MivbMYPU
RQ9RMC7MgESYbcqvZbkSh8QLs0dThKN7luoOZUOTBJov0Cw99US4fx/uD9NhUlN2
Jq9/DNTrkpBhelOBfV2UZoKNTtgydBhSc6cQeO+3KVNqQ4f2WX24TZT9RtzAVmV9
MB2UTWNm5yDuTVtc7QsfS5cIbsACaCB4BxOwxM8vWfRUvIZQOZhSZPZ+y/txKJfb
mJuovdpx4wifu3qEV0Mos9MA3PWkjCRQTPaWcdNdZ80YdQ46yArX2xN34j3fWmAq
ebMpC4elWP8bMQ1STd7rw0jblHBKIGAJhnB0pablLjIbNlz5zSIihfo6tiEKmksW
5Q5QZEQuvMB0IOkdIqJr/vFJZdafa3xUFEb7vK5cxcexlFA4bypWn17bpbnduDE/
YHJXM0iXOHRZNQORdO+vdjQPG9ppstamwEsqOIWecwSukDhLJULeI47GykMmxYhf
e/SRDyTOsBDJsOtnk8TJwouTymu6SKyWNUGd45Y3PJoDnu4k0+4=
=9y5b
-----END PGP SIGNATURE-----

--kjej36qishmfzyvg--
