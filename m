Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v2] i2c: riic: remove fixed clock restriction
Date: Wed, 11 Oct 2017 15:20:29 +0000
Message-ID: <SG2PR06MB11656505D83C3D552B2CAC2D8A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170929171637.121262-1-chris.brandt@renesas.com>
In-Reply-To: <20170929171637.121262-1-chris.brandt@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday, September 29, 2017, Chris Brandt wrote:
> Most systems with this i2c are going to have a clock of either 33.3MHz or
> 32MHz. That 4% difference is not reason enough to warrant that the driver
> to completely fail.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * simplified error message.
> ---

What ever happened to this patch?
Was there any objection?

Thanks,
Chris
