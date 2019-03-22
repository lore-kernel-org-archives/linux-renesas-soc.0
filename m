Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150ABC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:13:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4872218B0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="VLLVIODc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfCVKNQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 06:13:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfCVKNQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 06:13:16 -0400
Received: from penelope.horms.nl (unknown [195.39.71.253])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CFCEA25B79A;
        Fri, 22 Mar 2019 21:13:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553249594; bh=EECmRATkXepXe0Ku7ESabetzqm8yvdUAQ0DLVi2zcu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VLLVIODcQGger/HPMxQ7nKEQ3XXXE9RHjNVx5j3aBFLUQfknkUPg/zNAMhWaZYESR
         Kb6vbZmpZcvvxyCqygGobbH39KNK22zMXSadBz7bvC0J32AQtUswTipjTKUamqoqMb
         1Ai+Mm3KG1R+eTKimBgKtZaepiB8XHd9LpZ7fy8c=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 9A04AE21330; Fri, 22 Mar 2019 11:13:10 +0100 (CET)
Date:   Fri, 22 Mar 2019 11:13:10 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: Update Ebisu and Draak bootargs
Message-ID: <20190322101306.efcljvubpzkjs54r@verge.net.au>
References: <155300296860.12646.3763135168702689012.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155300296860.12646.3763135168702689012.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 10:42:48PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update Ebisu and Draak bootargs to match other boards
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks Magnus,

applied for v5.2.

> ---
> 
>  Developed on top of 5.1-rc1
> 
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |    2 +-
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> --- 0001/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ work/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts	2019-03-19 22:36:32.777708972 +0900
> @@ -19,7 +19,7 @@
>  	};
>  
>  	chosen {
> -		bootargs = "ignore_loglevel";
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> --- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2019-03-19 22:36:40.570117509 +0900
> @@ -20,7 +20,7 @@
>  	};
>  
>  	chosen {
> -		bootargs = "ignore_loglevel";
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> 
