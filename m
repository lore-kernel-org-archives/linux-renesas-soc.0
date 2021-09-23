Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD2FC433F5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Sep 2021 18:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D7736124B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Sep 2021 18:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242692AbhIWSHe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 14:07:34 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:60260 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242667AbhIWSHd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 14:07:33 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 4343B20A74C4
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [RFC/PATCH 04/18] ravb: Enable aligned_tx and tx_counters for
 RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20210923140813.13541-1-biju.das.jz@bp.renesas.com>
 <20210923140813.13541-5-biju.das.jz@bp.renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <61e541a7-338c-a9d1-0504-f2f7baf0ffed@omp.ru>
Date:   Thu, 23 Sep 2021 21:05:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210923140813.13541-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/23/21 5:07 PM, Biju Das wrote:

   Somehow this patch haven't reached my OMP email -- I got it only thru
 the linux-renesas-soc list... :-/

> RZ/G2L need 4byte address alignment like R-Car Gen2 and
> it has tx_counters like R-Car Gen3. This patch enable
> these features for RZ/G2L.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/net/ethernet/renesas/ravb.h      | 2 +-
>  drivers/net/ethernet/renesas/ravb_main.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index bee05e6fb815..bb92469d770e 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -195,7 +195,7 @@ enum ravb_reg {
>  	GECMR	= 0x05b0,
>  	MAHR	= 0x05c0,
>  	MALR	= 0x05c8,
> -	TROCR	= 0x0700,	/* R-Car Gen3 only */
> +	TROCR	= 0x0700,	/* R-Car Gen3 and RZ/G2L only */
>  	CEFCR	= 0x0740,
>  	FRECR	= 0x0748,
>  	TSFRCR	= 0x0750,
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 54c4d31a6950..d38fc33a8e93 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2114,6 +2114,8 @@ static const struct ravb_hw_info rgeth_hw_info = {
>  	.set_feature = ravb_set_features_rgeth,
>  	.dmac_init = ravb_dmac_init_rgeth,
>  	.emac_init = ravb_rgeth_emac_init,
> +	.aligned_tx = 1,
> +	.tx_counters = 1,

   Mhm, I don't see a connection between those 2 (other than they're both for RX). And anyway, this prolly
should be a part of the previous patch...

[...]

MBR, Sergey
