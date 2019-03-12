Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEB8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 15:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE25820693
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 15:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="wwkTpxSH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfCLPuJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 11:50:09 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38942 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfCLPuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 11:50:09 -0400
Received: by mail-lj1-f195.google.com with SMTP id g80so2768045ljg.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2019 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=eUMOS/xllJvYP6IP+O3s73/ZfLm0qafxhRBFq5fdCYI=;
        b=wwkTpxSH7J+GYE9rOC1rbEEUvQfoDv4ouoFTGcYjrOESEHtetaPWpYf/JR0/dVYZnC
         bWOfBBJkQpE/l8M8Sa7wO3y1n+6t64kHUDzltVlnCWmSz/dIaUR0sfWU+A85PM0EgPzN
         MrnUjIVHiaVaPKgR6i+lDrogwGNyq3xjMyTmnKJr/yenE0HpUwYiE8scueWkcUeTUSll
         8yzzG6VNOEm/vzhDgC6zhqzV8nhRYTtn/c19GMOE7PWyFhxBQ2q6noybDa8SmNUPHAxf
         294eiK9T0kWPVai3kMt5TMVm9D7UQffeDTNGSmqGPvgU3RliieJiIs8Y72yeG8Hxwy03
         +1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=eUMOS/xllJvYP6IP+O3s73/ZfLm0qafxhRBFq5fdCYI=;
        b=tCsA9e09yzbdEceS0gFI58xmShpYT8xha+YnparlbyWSlQYKvy7a4mw0Y2ngIRdV7F
         HM/64/w4E3mk80Q0Dgvx1i/PdD1JduXSYQ3cRHce8wokCDRy+TrtDjnGgVOywjciS4Fy
         SQovfdwh13WYBIRALPxu1tMsTjdM8iiF3KmLVvObA1NCPXoCSUxdtMtqkHdTAcV/LiJm
         LNymcyJCetcLC6nkRwWeuYwtsQes/6+tEiah+pbL0JU5ctl2F4NuFquOKYqWQ/p/n/hU
         yQPlG86Wxb8jnw4lwLyuprda5lOj4GNxYI80ezuyik7+h6pkzQagjRYYmfoCpvYx83BN
         Sd/Q==
X-Gm-Message-State: APjAAAWwUnNThxwNaH0dQZo5aapbkQJXOaYEf8eEKKCKp2Ffhw742WvB
        MDEvChcO8nvm+GhvKCUNpjgNbQ==
X-Google-Smtp-Source: APXvYqyIqYISVAOrgEKaTAijmhl9eXbsfkPyBzwGqBu5PPDcR4uIsB8vRmj/alxFVwaGmpyLPyYMXA==
X-Received: by 2002:a2e:9105:: with SMTP id m5mr20893998ljg.100.1552405806819;
        Tue, 12 Mar 2019 08:50:06 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id y1sm1418029ljj.13.2019.03.12.08.50.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2019 08:50:06 -0700 (PDT)
Date:   Tue, 12 Mar 2019 16:50:05 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools 0/2] tools: improvements to handling restricted
 addresses
Message-ID: <20190312155005.GA1776@bigcity.dyn.berto.se>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2019-03-11 23:33:33 +0100, Wolfram Sang wrote:
> For debugging, I needed to use the restricted address range. That's when I
> noticed that the docs for i2ctransfer were missing an update (patch 1). But
> even more surprising, I noticed that the reserved addresses 0x03-0x07 were not
> restricted. It seems we all are so used to our lovely i2c-tools that nobody
> (including me) never questioned that :) But it should be fixed (patch 2), I
> think.
> 
> Open for comments. Happy hacking!

I'm no expert in i2c but this matches my understanding of reserved 
addresses in the specification, feel free to add for the whole series

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> 
> Wolfram Sang (2):
>   tools: i2ctransfer: man: mention -a everywhere
>   tools: restrict all addresses defined by the standard
> 
>  CHANGES             |  2 ++
>  tools/i2cbusses.c   |  2 +-
>  tools/i2cdetect.8   |  2 +-
>  tools/i2cdetect.c   |  2 +-
>  tools/i2cdump.8     |  4 ++--
>  tools/i2cdump.c     |  2 +-
>  tools/i2cget.8      |  4 ++--
>  tools/i2cget.c      |  2 +-
>  tools/i2cset.8      |  4 ++--
>  tools/i2cset.c      |  2 +-
>  tools/i2ctransfer.8 | 12 +++++++-----
>  11 files changed, 21 insertions(+), 17 deletions(-)
> 
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
