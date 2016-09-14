Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35790 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755286AbcINJFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 05:05:37 -0400
Received: by mail-lf0-f44.google.com with SMTP id l131so5253799lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 02:05:36 -0700 (PDT)
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and
 MII pins
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
 <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
Cc: laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fce28dc4-f227-5e27-d31c-a6b5bca1c471@cogentembedded.com>
Date: Wed, 14 Sep 2016 12:05:32 +0300
MIME-Version: 1.0
In-Reply-To: <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/13/2016 5:03 PM, Niklas Söderlund wrote:

> Group the AVB pins into similar groups found in other sh-pfc drivers.
> The pins can not be muxed between functions other then AVB but there
> drive strength can be controlled.
>
> The group avb_mdc containing ADV_MDC and ADV_MDIO are on other SoCs
> called avb_mdio. In pfc-r8a7795 the adv_mdc group already existed and
                                       ^^^^^^^ avb_mdc?

> is in use in DT. Therefor the ADV_MDIO pin to the existing group

    Therefore. And you missed a verb.

> instead of renaming it.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 4a60f15..7b9a355 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
[...]
>  static const unsigned int can0_data_a_pins[] = {
> @@ -3632,6 +3654,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>  	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
>  	SH_PFC_PIN_GROUP(avb_avtp_match_b),
>  	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
> +	SH_PFC_PIN_GROUP(avb_mii),
>  	SH_PFC_PIN_GROUP(can0_data_a),
>  	SH_PFC_PIN_GROUP(can0_data_b),
>  	SH_PFC_PIN_GROUP(can1_data),
> @@ -3928,6 +3951,7 @@ static const char * const avb_groups[] = {
>  	"avb_avtp_capture_a",
>  	"avb_avtp_match_b",
>  	"avb_avtp_capture_b",
> +	"avb_mii",

    I'd prefer if this group preceded the capture/match groups.

[...]

MBR, Sergei
