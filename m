Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/9] Renesas RZ/A1 pin and gpio controller
Date: Mon, 10 Apr 2017 02:33:36 +0000
Message-ID: <SG2PR06MB1165D83E182D6B043C3C59928A010@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wednesday, April 05, 2017, Jacopo Mondi wrote:
> v3 -> v4:
> - use "pinmux" property in pmx sub-nodes in place of "renesas,pins"
> - use pinconf standard properties to set pin mux additional flags
> - add "bi-directional" and "output-enable" to pinconf generic properties
> - perform pmx function parsing at dt_node_to_map() time
> - change DT bindings to use GENERIC_PINCONF
> - change DT bindings to allow sub-nodes to have "pinmux" property
> specified
> - several renames (register names, DT parse functions, set_mux() function=
)


I just tested this driver on the RZ/A1 RSK board.
The following worked good.

   SCIF2, I2C, SDHI, Ethernet


SDHI also has bi-direction pins. For your reference, here was my DT:


	/* SHDI ch1 on CN1 */
	sdhi1_pins: sdhi1 {
		pins {
			pinmux =3D <RZA1_PINMUX(3, 8, 7)>,	/* SD_CD_1 */
				 <RZA1_PINMUX(3, 9, 7)>,	/* SD_WP_1 */
				 <RZA1_PINMUX(3, 12, 7)>,	/* SD_CLK_1 */
				 <RZA1_PINMUX(3, 13, 7)>;	/* SD_CMD_1 */
		};

		pins_bidir {
			pinmux =3D <RZA1_PINMUX(3, 10, 7)>,	/* SD_D1_1 */
				 <RZA1_PINMUX(3, 11, 7)>,	/* SD_D0_1 */
				 <RZA1_PINMUX(3, 14, 7)>,	/* SD_D3_1 */
				 <RZA1_PINMUX(3, 15, 7)>;	/* SD_D2_1 */
			bi-directional;
		};
	};


Thanks,
Chris
