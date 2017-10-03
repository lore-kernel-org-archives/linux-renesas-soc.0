Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:56825 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751327AbdJCJg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 05:36:57 -0400
Received: by mail-lf0-f48.google.com with SMTP id 90so797228lfs.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Oct 2017 02:36:57 -0700 (PDT)
Subject: Re: [RFC][PATCH 4/4] pinctrl: sh-pfc: r8a77995: add Audio SSI pin
 support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <87efqlou4w.wl%kuninori.morimoto.gx@renesas.com>
 <878tgtou1t.wl%kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e0366eaf-7163-0037-de60-833df0ade812@cogentembedded.com>
Date: Tue, 3 Oct 2017 12:36:54 +0300
MIME-Version: 1.0
In-Reply-To: <878tgtou1t.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/3/2017 5:23 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 60 +++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> index 2b56253..1a5c5a7 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -1232,6 +1232,50 @@ enum {
>   	SCIF_CLK_MARK,
>   };
>   
> +/* - SSI ---------------------------------------------------------------*/
> +static const unsigned int ssi3_data_pins[] = {
> +	/* SDATA3 */
> +	RCAR_GP_PIN(4, 3),
> +};
> +static const unsigned int ssi3_data_mux[] = {
> +	SSI_SDATA3_MARK,
> +};
> +static const unsigned int ssi34_ctrl_pins[] = {
> +	/* SCK34,  WS34 */
> +	RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 4),
> +};
> +static const unsigned int ssi34_ctrl_mux[] = {
> +	SSI_SCK34_MARK, SSI_WS34_MARK,
> +};
> +static const unsigned int ssi4_ctrl_a_pins[] = {
> +	/* SCK4_A, WS4_A */

    Why these sudden A/B suffixes in the comments?
We haven't had them yet, I think.

> +	RCAR_GP_PIN(4, 5), RCAR_GP_PIN(4, 7),
> +};
> +static const unsigned int ssi4_ctrl_a_mux[] = {
> +	SSI_SCK4_A_MARK, SSI_WS4_A_MARK,
> +};
> +static const unsigned int ssi4_data_a_pins[] = {
> +	/* SDATA4_A */
> +	RCAR_GP_PIN(4, 6),
> +};
> +static const unsigned int ssi4_data_a_mux[] = {
> +	SSI_SDATA4_A_MARK,
> +};
> +static const unsigned int ssi4_ctrl_b_pins[] = {
> +	/* SCK4_B, WS4_B */
> +	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 20),
> +};
> +static const unsigned int ssi4_ctrl_b_mux[] = {
> +	SSI_SCK4_B_MARK, SSI_WS4_B_MARK,
> +};
> +static const unsigned int ssi4_data_b_pins[] = {
> +	/* SDATA4_B */
> +	RCAR_GP_PIN(2, 16),
> +};
> +static const unsigned int ssi4_data_b_mux[] = {
> +	SSI_SDATA4_B_MARK,
> +};
> +
>   static const struct sh_pfc_pin_group pinmux_groups[] = {
>   	SH_PFC_PIN_GROUP(audio_clka),
>   	SH_PFC_PIN_GROUP(audio_clkb),
[...]

MBR, Sergei
