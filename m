Return-Path: <SRS0=Pe4N=PW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A3DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jan 2019 14:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 467272086D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Jan 2019 14:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="YT7QvGVQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfANOjb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Jan 2019 09:39:31 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42057 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfANOja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jan 2019 09:39:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so19199220lja.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jan 2019 06:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RggfLUBe4APAkaLDKAqRxE88hCqnQQHf9sI65y9ASls=;
        b=YT7QvGVQJ/RVxI1RpYLjCkH+oyS04K8wKNO6EOG4HjNnvZo4Epnndtp0iq0gisHhHC
         H+a/TdfCovOsBX/DFfEbOOWX2YwtpsBo4/bGRSdkxQXPh+iMLq+W3amnFIC4JGi1KOkG
         icmbZcTrTbDtOQ1F1/9cs7Nu4KqsxcvDL5/EaaMEtLlhPKdtCd99hM09sqhG+oRj5elc
         PSFbEl8aBObjaX9EcztCHAvUzTiZHItaraFwzhr+D21kxR7sd71GCbGxGnFc3R5f35EN
         sNcjkAs4kupWb2QDLUMC+UV+jkCm3drOZZlHeHcmNN+DKWuYOyXvNGx4wjC0DQuOku2J
         NyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RggfLUBe4APAkaLDKAqRxE88hCqnQQHf9sI65y9ASls=;
        b=tD34ecpCHPghXq9Uqrqse0EhlgjfTAuT7bVDigxPzFjp460yCC71gsg/204wLI6mL3
         dNqOUxD7rFONgAnbqGcWm5qWHYTlnUK2VAhuF6ZQKHdEhtI7a758Nf1NgxlALPmkuSQ3
         lO6h+nKMHZw+IA1ct+GT5LRDf7udycQGRiQwdr7a/oJFFXnNhoLJm0032wFi0HmwAfE9
         /fC44xPD4JRC9EzMshWEzO57oinlDjFjR+x5lVCY27IB+sRyT07gun1JvPKf02edy1Ph
         Lc75MMLMJQh0fbPtsXJn8vrXjidQQ4KbT1VtMSpYrOZ9e1z+wW12IWVk8qmcBMf8prHy
         9kyA==
X-Gm-Message-State: AJcUukf1spv1yfWKZdYIqdcGRzh0E7er0bUlTgSaFzgDUyWXPIiiQfzA
        J9e24CmRBIqV/l4GcEM56PN99Q==
X-Google-Smtp-Source: ALg8bN5RW8mfWpPVZ5b4LKRR5YqMN5C5uTeOIAOsJwbyDlT6ZRaFs354YbaNcb96eS+p2MqjGX7uOw==
X-Received: by 2002:a2e:a0d3:: with SMTP id f19-v6mr14416195ljm.48.1547476768691;
        Mon, 14 Jan 2019 06:39:28 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id 85-v6sm111163lja.16.2019.01.14.06.39.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 06:39:28 -0800 (PST)
Date:   Mon, 14 Jan 2019 15:39:27 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: rcar-gen3: Deduplicate remaining
 VIN pin definitions
Message-ID: <20190114143927.GF30160@bigcity.dyn.berto.se>
References: <20190111122705.32365-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190111122705.32365-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-01-11 13:27:01 +0100, Geert Uytterhoeven wrote:
> 	Hi,
> 
> As of commit 50f3f2d73e3426ba ("pinctrl: sh-pfc: Reduce kernel size for
> narrow VIN channels"), the infrastructure is available to avoid
> duplication of pin definitions for narrow Video IN (VIN) channels.
> Make use of his to deduplicate the remaining VIN pin definitions on
> R-Car Gen3 SoCS.
> 
> This is similar to what was done before for the wide VIN channels e.g.
> commit 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
> definitions").
> 
> This reduces kernel size for an R-Car Gen3 kernel by almost 1 KiB.
> 
> I plan to queue these in sh-pfc-for-v5.1.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   pinctrl: sh-pfc: r8a7795: Deduplicate VIN5 pin definitions
>   pinctrl: sh-pfc: r8a7796: Deduplicate VIN5 pin definitions
>   pinctrl: sh-pfc: r8a77970: Deduplicate VIN[01] pin definitions
>   pinctrl: sh-pfc: r8a77980: Deduplicate VIN1 pin definitions
> 
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |  90 ++++++------------
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |  90 ++++++------------
>  drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 128 +++++++++-----------------
>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c |  64 +++++--------
>  4 files changed, 115 insertions(+), 257 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
