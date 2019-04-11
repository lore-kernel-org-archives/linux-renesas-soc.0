Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994CAC10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 16:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 592272146F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 16:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="Vnh7M0nM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfDKQra (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 12:47:30 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:43581 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfDKQr3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 12:47:29 -0400
Received: by mail-lj1-f179.google.com with SMTP id f18so6142645lja.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2019 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7TOrm/pIUjywy+PcLxQavGH3pPV+PtonB7njN6vd3Vk=;
        b=Vnh7M0nM7lWbgVm8irPx5LIVNe97+r/gl4keZFc+9YVrPBx0FufjXVvUQCET7Thyyw
         tsljOfFLHNVZqbM3nlPfEEJpMYMO/61zmwdcqal2HOPCPWjmsx+Hb2+DQHY4pWhbrrRg
         SrgR0AM3sGNUj+D/c6jDTe/hrdjP94YkBxIOVxsKPsFzQi+Tn9ghmZbz5IbrL29G6EfN
         FFxekp41AhMIsg70/XHNnKiSdTrm3SRHmrAYHnQ+NLlK4o0pTeM56U+uG6Ab5L0WE7fe
         5pCZOHzjufzYBFJ1z+qaJGQP8Ft+VSCjvzsaGb6qSR8mcbYJu1rB1pIp+b+Lw8NocFQV
         pZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7TOrm/pIUjywy+PcLxQavGH3pPV+PtonB7njN6vd3Vk=;
        b=Xp2QaCd9BFe3o8KV7CSUtzA1O87fpQzLb18hmYfccPqr4wCHMDwhhVcqibgpcgo716
         PbFNUAZevNz370ZNNCX0f+ntLaYEUC5MZsURCqWA32ePdh+BnygRz01NXpsPs5fCLEIg
         IiQ5gY/SalTfay9yflORJRjUDA/NJx04oukv3wK9+aTKd7NL9fNEgcOkuMxYRaG1mXQ3
         OVYlW0SP2+ePR77P3riKngsQ3OAPNslo7NJSltASzXWS+mstultliKVydy7CXTWHqJmH
         EFkbVRA1PuydgqOq+f/B/TDBOz7hwRqL96fT6OAMB0EQtLRkIXMEdpkDo79jYUsyBaQX
         v8Sw==
X-Gm-Message-State: APjAAAUFguzGsmKkwLh7pMcbZ58aLU8auBQ3DQzrFcdvNdktj/XJIzsJ
        tpqa7ndDrsalsLVg7xu/GyBbfQ==
X-Google-Smtp-Source: APXvYqyiUySD+Iexj0LgZ0MKP+TmhGxuIn8SCyQW6/VeGdC0Fx8RhazqSDDQf/mawoEXeCRLjORQ8Q==
X-Received: by 2002:a2e:420c:: with SMTP id p12mr27591808lja.1.1555001247610;
        Thu, 11 Apr 2019 09:47:27 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id s24sm7778325ljs.30.2019.04.11.09.47.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 09:47:26 -0700 (PDT)
Date:   Thu, 11 Apr 2019 18:47:25 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
Message-ID: <20190411164725.GE30887@bigcity.dyn.berto.se>
References: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
 <20190110163356.GF24252@bigcity.dyn.berto.se>
 <20190408122941.wziujh5ibgwy5cdp@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190408122941.wziujh5ibgwy5cdp@verge.net.au>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On 2019-04-08 14:29:41 +0200, Simon Horman wrote:
> > > @@ -3172,11 +3158,15 @@
> > >  
> > >  			cooling-maps {
> > >  				map0 {
> > > -					trip = <&sensor3_passive>;
> > > -					cooling-device = <&a57_0 4 4>,
> > > -							 <&a57_1 4 4>,
> > > -							 <&a57_2 4 4>,
> > > -							 <&a57_3 4 4>;
> > > +					trip = <&target>;
> > > +					cooling-device = <&a57_0 0 2>;
> > 
> > We have 5 (0-4) cooling states for the A57s on this SoC. Out of 
> > curiosity why allow states 0-2 here and not force it do more cooling or 
> > keep the to max cooling (4) as before this change as this is set to a 
> > trip point with a rather large temperature? Not saying this is wrong 
> > only curious :-)
> 
> This I do not know. Do you think it would be worth following-up on
> internally?

I'm no expert on this but I think it could be educational to learn why 
not the full range is used. Still this might be correct so I don't want 
to block this patch based on my ignorance.

-- 
Regards,
Niklas Söderlund
