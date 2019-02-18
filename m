Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547C2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C82A2173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 10:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfBRKkg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:40:36 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:19877 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfBRKkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 05:40:36 -0500
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v1IAeVPsB
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 18 Feb 2019 11:40:31 +0100 (CET)
Date:   Mon, 18 Feb 2019 11:40:30 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1139737677.514003.1550486431036@webmail.strato.com>
In-Reply-To: <20190218100313.14529-2-niklas.soderlund+renesas@ragnatech.se>
References: <20190218100313.14529-1-niklas.soderlund+renesas@ragnatech.se>
 <20190218100313.14529-2-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/3] rcar-csi2: Update V3M and E3 start procedure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev50
X-Originating-IP: 188.192.207.28
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On February 18, 2019 at 11:03 AM Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se> wrote:
> 
> 
> The latest datasheet (rev 1.50) updates the start procedure for V3M and
> E3. Update the driver to match these changes.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 664d3784be2b9db9..fbbe86a7a0fe14ab 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -940,11 +940,11 @@ static int rcsi2_init_phtw_v3m_e3(struct rcar_csi2 *priv, unsigned int mbps)
>  static int rcsi2_confirm_start_v3m_e3(struct rcar_csi2 *priv)
>  {
>  	static const struct phtw_value step1[] = {
> -		{ .data = 0xed, .code = 0x34 },
> -		{ .data = 0xed, .code = 0x44 },
> -		{ .data = 0xed, .code = 0x54 },
> -		{ .data = 0xed, .code = 0x84 },
> -		{ .data = 0xed, .code = 0x94 },
> +		{ .data = 0xee, .code = 0x34 },
> +		{ .data = 0xee, .code = 0x44 },
> +		{ .data = 0xee, .code = 0x54 },
> +		{ .data = 0xee, .code = 0x84 },
> +		{ .data = 0xee, .code = 0x94 },
>  		{ /* sentinel */ },
>  	};

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
