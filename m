Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B4FC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 10:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D937218AD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 10:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="Tx8WMpCE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbfAXKY0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 05:24:26 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38833 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbfAXKY0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 05:24:26 -0500
Received: by mail-lj1-f194.google.com with SMTP id c19-v6so4737683lja.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jan 2019 02:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=F/R3ze9ZdwqokKpW1o5JVl6L915c9y8awDXkEmtSF8M=;
        b=Tx8WMpCEAzTD1e4ilODN0eDGTH6+jUY8Vmkjn7ifN1Np1llg4/8BATgQ3PfYu5ZaPu
         HjXmnuNl3eDRYGGeDEN/YiruiPn7tP3+ISsLVjVuEHekVCehNDtfH8pFRFdH4nCmMLYI
         jcESpny/aSNQ9meKAVOP6QU1gkqUGlHskD5Zze0CuFPrtU5dhq8GT6DRX7lTVtXT9uSt
         jSemLU5uB89l2mPfvLgkF1BqNZIJKAEsrOjXSLMLsoIXS0b0/G0rBYnsFOB/8wwZ+07k
         jbZDoQpz1fhbnHewdgVl+UyS7KF4R2MkUxDzUgyd4gv72VceyzblHRc5Of7ZH7Tig46v
         aRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F/R3ze9ZdwqokKpW1o5JVl6L915c9y8awDXkEmtSF8M=;
        b=WfdUnejXwbp1Mz0hygeUjYTEg+PK2JPm/8AA5GYg7mg30UnlURnckbIoVs41ZuWKIS
         OCvEUJPXR+4XDHUvr6FjEmOwlh/78f7scAaOAVBmfTC6eY2gyY1V1J5VaFfRt5+hoEPX
         UlhV7fGPMfeDrbAdJNKoxOyWYrZsNSaim3Lkoc/f6x4SYvGsSsDSAfrJfa4PZuieW3tG
         058o+BZWgm8Li5kb/2X9sFFG2ckHBxO+R1bVdNEr6lUJzHCRnxIIvuLCoQoM7a6CqBQt
         EtwwKmk/x1QLjDUOYdv9YLZnVl6YkIU4QtLAVMwnPdyh37OpMDUmDQh9bkSxXzyo6Tpu
         AucQ==
X-Gm-Message-State: AJcUukffHgH2iFaw9GjE4k6zxLwKhQ1bFOkcA1A3wMu0zCdV7dQt2xOl
        Yh6MGukuN1EBDbQulQP3CBxz/Q==
X-Google-Smtp-Source: ALg8bN5y7hAzqmGcV6cWU8iA20fwQAZVRK7fcG/Uf1IN11NoB2cfUNrSBZXqvjrcqBY3MUHJJsKhMg==
X-Received: by 2002:a2e:8446:: with SMTP id u6-v6mr4971196ljh.74.1548325463789;
        Thu, 24 Jan 2019 02:24:23 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id n8-v6sm1005233lji.90.2019.01.24.02.24.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jan 2019 02:24:23 -0800 (PST)
Date:   Thu, 24 Jan 2019 11:24:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20190124102422.GT4127@bigcity.dyn.berto.se>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai>
 <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
 <20181205204628.wvc2d4zfynbrztgq@ninjato>
 <20181205213613.GA20406@bigcity.dyn.berto.se>
 <20181207205204.GF17972@bigcity.dyn.berto.se>
 <CAMuHMdWH3G-80Ay=xi+HhRFMTQ=f6idDLFXt94sj5GmppC55Uw@mail.gmail.com>
 <20181218102412.4h3iyevlrmhhnjds@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181218102412.4h3iyevlrmhhnjds@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On 2018-12-18 11:24:13 +0100, Simon Horman wrote:
> On Tue, Dec 18, 2018 at 10:07:13AM +0100, Geert Uytterhoeven wrote:
> > Hi Niklas, Simon,
> > 
> > On Fri, Dec 7, 2018 at 9:52 PM Niklas Söderlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > > On 2018-12-05 22:36:13 +0100, Niklas Söderlund wrote:
> > > > On 2018-12-05 21:46:28 +0100, Wolfram Sang wrote:
> > > > > On Fri, Nov 02, 2018 at 12:57:19PM +0100, Simon Horman wrote:
> > > > > > On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> > > > > > >
> > > > > > > > This patch have quiet a few dependencies I'm afraid, let me know if you
> > > > > > > > wish to be notified once they all upstream. I don't think it's a good
> > > > > > > > idea to pick this up before all dependencies are resolved.
> > > > > > >
> > > > > > > Yes, we should do that. Ping Simon once all dependencies are in next. It
> > > > > > > is still fine to have this patch here in case people want to test. BTW
> > > > > > > did you mention your branch somewhere where you collected all these
> > > > > > > patches to make HS400 working/enabled?
> > > > > > >
> > > > > > > For this patch already:
> > > > > > >
> > > > > > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > > > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > >
> > > > > > Thanks, I am marking this as deferred.
> > > > > >
> > > > > > Please repost or ping me once the dependencies are present in
> > > > > > an rc release.
> > > > >
> > > > > Niklas, are we done now, so we can ask Simon to pick up the DTS change?
> > > > >
> > > >
> > > > Almost :-)
> > > >
> > > > I'm  waiting for Geert to take the SD quirk patches before pinging Simon
> > > > to take this one. Spoke to him today about that so I hope it will not be
> > > > to long.
> > > >
> > >
> > > I just confirmation that the clock patches have been pulled into
> > > clk-next so this patch is ready to be consumed by you Simon.
> > >
> > > Would it be possible to get this in this cycle or is it to late? I know
> > > you wished to close your tree for v4.21 at the end of this week which it
> > > technically is now ;-)
> > 
> > This patch seems to depend on both the clock patches, and mmc/next.
> > Else the kernel hangs with an rcu check :-(
> > 
> > Hence please drop, and requeue in renesas-devel after the release of v4.21-rc1.
> 
> Thanks, dropped and marked as deferred.
> 
> Niklas, please repost or ping me once the dependencies are present in an RC
> release.

Ping.

-- 
Regards,
Niklas Söderlund
