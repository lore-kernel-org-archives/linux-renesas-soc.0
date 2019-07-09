Return-Path: <SRS0=GrwY=VG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C16C73C46
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Jul 2019 16:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08556216E3
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Jul 2019 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562689536;
	bh=oaEhQHvFZBNfw9/1aL8Ojre3aQt9s5msbxq1Pms1Fpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nzDkkPVX3Ldwjg6yavk1f2ZaAyigXNFpKKAnk7FL8yNwne1C1QH3uiTyGmV3jJvVw
	 ft/8nK1x+cUqvzfiKzCjGMG4nqMzRfkGtqMjkSL/RpAVNrGPJXGOI92DaAHIkgf9QE
	 EuHyOJRYNq8enEa5oCeDLv+Ws6Oggyo1pfieHfeM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfGIQZf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Jul 2019 12:25:35 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40708 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfGIQZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:25:35 -0400
Received: by mail-io1-f66.google.com with SMTP id h6so36223721iom.7;
        Tue, 09 Jul 2019 09:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zl2or5IpK4l7LvGyL3T0+ECWeMAnJjnZGIRdm+o5irc=;
        b=Gkvkg167uXoOQd2eJkq0Yf45dhSY9pFq0UOFjQTW5ZiVu0VWcgV+gFa1L1ncnu6v6y
         Oj3jw50i17msQXgsrzAQKwIVRoEjl6M2rP1M/4+xt6yi9RG5UO4ZmDlbMuYJUmzgaJN5
         BGMPR7BeSfKHaXRMCdvRMbSPs+a99nTWalTregPaxJkPMLhEOGMSIyx2wZlzAGLqjUSu
         jls7OlGcBjfTr/ibDnO+vXXawZt6fwP0csDpycHTV9p8RoCwJixK9fA/4A+4oEcro2GP
         ePSQfJs39zgVHv79UO1MSWnlYLASqakENTGSPXSijaqcLOjNHMdoD4jKTMVblZUJfvR8
         OZkw==
X-Gm-Message-State: APjAAAWi4QgcjL7//fgeh9sXW3qErh9TQ+AQUO6dxSIAOJctAqohjGv8
        10k11T9g2arbBTHS1/S6ig==
X-Google-Smtp-Source: APXvYqzVgtv6DKIdNdWYreUqzxbPg02yi2CqE2Sx2hOSj3jGuGB8ksa9c4r6BLsvAQiOPNp7HuzIbg==
X-Received: by 2002:a02:aa0d:: with SMTP id r13mr28753021jam.129.1562689534170;
        Tue, 09 Jul 2019 09:25:34 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u4sm26806383iol.59.2019.07.09.09.25.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 09:25:33 -0700 (PDT)
Date:   Tue, 9 Jul 2019 10:25:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, mark.rutland@arm.com,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1
 to r8a77995
Message-ID: <20190709162531.GA13560@bogus>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
 <156076223184.4736.11067127180512614106.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076223184.4736.11067127180512614106.sendpatchset@octo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Jun 2019 18:03:51 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch adds DT binding documentation for the CMT devices on
> the R-Car Gen3 D3 (r8a77995) SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- 0012/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 14:00:04.813217175 +0900
> @@ -53,6 +53,8 @@ Required Properties:
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
>      - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
>      - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
> +    - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
> +    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
>      - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
>      - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
>      - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
> 

Reviewed-by: Rob Herring <robh@kernel.org>
