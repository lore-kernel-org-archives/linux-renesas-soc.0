Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27DDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 743EE2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JVdMuWzl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389306AbeLQT4s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:56:48 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45760 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387549AbeLQT4r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 14:56:47 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4DD1525B812;
        Tue, 18 Dec 2018 06:56:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545076605; bh=I4uqKnKYyZL9t9j+IbmAqYwAyqCybNpoGI1aj2WdQtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JVdMuWzlyIf4ng8aZBykCOn0+FRPGehlt4ZdUmDrlc54IUB+29I8U9Ft3mXV3BXjp
         +mvN8bYMQKQo3xp/1z/4B84nWD0BytdG1j49PyowG4Ninsi/rF6UD4AvyINjaxU3K0
         MTSRFsz7z66m/dOGGNcAc6wwpV6lKtq6a25Jndwk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 59E6194048A; Mon, 17 Dec 2018 20:56:42 +0100 (CET)
Date:   Mon, 17 Dec 2018 20:56:42 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT v2 1/2] dt-bindings: thermal: rcar-thermal: add
 R8A77990 support
Message-ID: <20181217195641.yy57kzq6bjpb47qy@verge.net.au>
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
 <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 11:50:20PM +0900, Yoshihiro Kaneko wrote:
> Document the R-Car E3 (R8A77990) SoC bindings.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

As per v1:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Tested-by: Simon Horman <horms+renesas@verge.net.au>

