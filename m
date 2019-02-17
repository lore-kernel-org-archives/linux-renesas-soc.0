Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D642C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D686621917
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 02:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WsNK1V38"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfBQCmk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 21:42:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfBQCmk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 21:42:40 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 952D949;
        Sun, 17 Feb 2019 03:42:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550371358;
        bh=LKyl/vUB0nbJP0ntXOX6jGUdw2rcSyvkBc9l9Lxo/yI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WsNK1V38IfUQDZ11pfNE5bZT3mcWSICsMpU8uo1pmStqBNWnB0A3kwPcqjBgp1GIH
         dVRhHYOqpgdLR4RIVoOYFg0CLDoszO6o/XlM81lcAJN/tkBdRPPKiMI0KeN5KfBK2Y
         +Pdh49GUWjjm0KZ5+lPn39jVLkA8b+yZMbUJkWxs=
Date:   Sun, 17 Feb 2019 04:42:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 4/7] vsp-lib: trivial: Fix spelling of Reference
Message-ID: <20190217024235.GB20463@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-5-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204155146.9726-5-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Dec 04, 2018 at 03:51:43PM +0000, Kieran Bingham wrote:
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  scripts/vsp-lib.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 56969606382f..cf15a045ea8c 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -95,7 +95,7 @@ vsp1_set_control() {
>  }
>  
>  # -----------------------------------------------------------------------------
> -# Referance frame generation
> +# Reference frame generation
>  #
>  
>  reference_frame() {

-- 
Regards,

Laurent Pinchart
