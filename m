Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v3] i2c: riic: remove fixed clock restriction
Date: Tue, 17 Oct 2017 20:31:05 +0000
Message-ID: <SG2PR06MB11652F2C132728B93232119C8A4C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20171016183253.2291-1-chris.brandt@renesas.com>
In-Reply-To: <20171016183253.2291-1-chris.brandt@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Monday, October 16, 2017, Chris Brandt wrote:
> Most systems with this i2c are going to have a clock of either 33.33MHz o=
r
> 32MHz. That 4% difference is not reason enough to warrant that the driver
> to completely fail.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
>  * now check a range of safe frequencies
> v2:
>  * simplified error message.
> ---

Actually, if you want to hold off on this patch, I'm almost done with a=20
real fix which is to calculate any frequency based on current parent=20
clock and rise/fall timings specified in the DT as you suggested.


Chris
