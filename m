Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36561 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751962AbcF2M2G convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 08:28:06 -0400
Received: by mail-io0-f193.google.com with SMTP id s63so5065360ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2016 05:28:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467106492-1341-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1467106492-1341-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jun 2016 14:28:05 +0200
Message-ID: <CAMuHMdVHB89JMs=Jn0UF_SF2jyWgG0WJUPE0LtRkDc57558LgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: Initial R8A7796 PFC support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Tue, Jun 28, 2016 at 11:34 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds initial pinctrl driver to support for the R8A7796 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [uli: rebased on top of renesas-drivers]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Thanks for picking up this patch!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
> @@ -20,6 +20,7 @@ Required Properties:
>      - "renesas,pfc-r8a7793": for R8A7793 (R-Car M2-N) compatible pin-controller.
>      - "renesas,pfc-r8a7794": for R8A7794 (R-Car E2) compatible pin-controller.
>      - "renesas,pfc-r8a7795": for R8A7795 (R-Car H3) compatible pin-controller.
> +    - "renesas,pfc-r8a7796": for R8A7796 (R-Car M3) compatible pin-controller.

R-Car M3-W

>      - "renesas,pfc-sh73a0": for SH73A0 (SH-Mobile AG5) compatible pin-controller.
>
>    - reg: Base address and length of each memory resource used by the pin

> --- a/drivers/pinctrl/sh-pfc/Makefile
> +++ b/drivers/pinctrl/sh-pfc/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7791)     += pfc-r8a7791.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7793)      += pfc-r8a7791.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7794)      += pfc-r8a7794.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7795)      += pfc-r8a7795.o
> +obj-$(CONFIG_PINCTRL_PFC_R8A7796)       += pfc-r8a7796.o

Something's wrong with indentation here... Ah, spaces i.s.o. TABs.

>  obj-$(CONFIG_PINCTRL_PFC_SH7203)       += pfc-sh7203.o
>  obj-$(CONFIG_PINCTRL_PFC_SH7264)       += pfc-sh7264.o
>  obj-$(CONFIG_PINCTRL_PFC_SH7269)       += pfc-sh7269.o

> --- /dev/null
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c

> +#define IP0_27_24      FM(IRQ0)                FM(QPOLB)       F_(0, 0)                FM(DU_CDE)                      FM(VI4_DATA0_B) FM(CAN0_TX_B)   FM(CANFD0_TX_B)         FM(MSIOF3_SS1_E) F_(0, 0)               F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0_31_28      FM(IRQ1)                FM(QPOLA)       F_(0, 0)                FM(DU_DISP)                     FM(VI4_DATA1_B) FM(CAN0_RX_B)   FM(CANFD0_RX_B)         FM(MSIOF3_SS2_E) F_(0, 0)               F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1_3_0        FM(IRQ2)                FM(QCPV_QDE)    F_(0, 0)                FM(DU_EXODDF_DU_ODDF_DISP_CDE)  FM(VI4_DATA2_B) F_(0, 0)        F_(0, 0)                FM(MSIOF3_SYNC_E) F_(0, 0)              FM(PWM3_B)      F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1_7_4        FM(IRQ3)                FM(QSTVB_QVE)   FM(A25)                 FM(DU_DOTCLKOUT1)               FM(VI4_DATA3_B) F_(0, 0)        F_(0, 0)                FM(MSIOF3_SCK_E) F_(0, 0)               FM(PWM4_B)      F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1_11_8       FM(IRQ4)                FM(QSTH_QHS)    FM(A24)                 FM(DU_EXHSYNC_DU_HSYNC)         FM(VI4_DATA4_B) F_(0, 0)        F_(0, 0)                FM(MSIOF3_RXD_E) F_(0, 0)               FM(PWM5_B)      F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1_15_12      FM(IRQ5)                FM(QSTB_QHE)    FM(A23)                 FM(DU_EXVSYNC_DU_VSYNC)         FM(VI4_DATA5_B) F_(0, 0)        F_(0, 0)                FM(MSIOF3_TXD_E) F_(0, 0)               FM(PWM6_B)      F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

Please remove spaces just before TABs.

> +       { PINMUX_CFG_REG("IPSR17", 0xe6060244, 32, 4) {
> +               IP17_31_28
> +               IP17_27_24
> +               IP17_23_20
> +               IP17_19_16
> +               IP17_15_12
> +               IP17_11_8
> +               IP17_7_4
> +               IP17_3_0 }
> +       },
> +       { PINMUX_CFG_REG("IPSR17", 0xe6060248, 32, 4) {

IPSR18?

> +               /* IP18_31_28 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +               /* IP18_27_24 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +               /* IP18_23_20 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +               /* IP18_19_16 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +               /* IP18_15_12 */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +               /* IP18_11_8  */ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
> +               IP18_7_4
> +               IP18_3_0 }
> +       },

BTW, when comparing this to pfc-r8a7795.c, I discovered some oddities:
  - Somewhere around IPSR10, the definitions started to become shifted by
    one register. E.g. IP10_27_24 on r8a7795 matches IP11_27_24 on r8a7796.
    What's happening there?
  - pfc-r8a7795 lacks IPSR18,
  - pfc-r8a7796 defines more functions.

Having a quick look at the datasheet, it seems pfc-r8a7796 is (more) correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
