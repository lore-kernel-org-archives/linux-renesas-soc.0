Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD3EC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:22:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50CDC222C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="G+fPHMdh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbfBMJWN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 04:22:13 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40961 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbfBMJWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 04:22:13 -0500
Received: by mail-lf1-f65.google.com with SMTP id e27so1206886lfj.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 01:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=JQ22X/4UZtcBww2Gl8Z9E4LsW9dFKKODbzD6nSDr9ZM=;
        b=G+fPHMdh8D1aQgm2AgAFlGjVDMorON1UaCW1qNloTpCF9p+mOrNwYxR+3D6OTjQ8Qd
         EYp228o0ff3xGM0jUVULyRoj8mnhFg6O3B1HLz/XqBjqyKc2KPKP3UwPa0ToaMoIxZR7
         veYO3oqCzb+sqoCvBzyVZ6fdiSZQlI59kXqyvxdvBlHCxN5sPbaJ/sgwrdQyFzkcPOqN
         WkRQx4h6mCQuUEcwwsKB3ZukoXYOBD1237JiaZwo0Urp17d7FEPZEiFrmLlVOFrj60E3
         hFCYksocVWR71hvS5S3K00oG8ABR7GNmdQVXhoUdNiiqElx7Zy2OUfpVuf7C2fekwOT1
         pd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=JQ22X/4UZtcBww2Gl8Z9E4LsW9dFKKODbzD6nSDr9ZM=;
        b=AGuOvU23K4vwb54jq1DPPPwjsfqD4KOsj+nfH3LNOsFUGSTngPXqzb913Ecim+Ai3Z
         EzJ+UuQ26ya06PjG1eJ45TzmDuF0PP5MPEXibHFFLp6M/Bs6pdn9x9UgGLquQb1jBsrz
         DV0Pkkw9sjqR4eACF6IM3n3mIZsMlt0Hj5D3isU5WMOd0kWdyhP1j9fCKwI7sSv1TwZl
         ni3yphyEcrItqbqY7jpFukQw+u7avw7H2Y57jtL1bBWsNmJv4rHCjLdjgHbqyqoJ+pbF
         inzvXH4A4PNJv1n25cRol9vG7KdyST2EX6pEj8dXAwv+0blB6c3t+LjtE3L5hy41i7pH
         s/hw==
X-Gm-Message-State: AHQUAuZSX653kgVV9yAdnL6rUmKy3jGkmhLoTehjAAmK8WkBMoDVPqDx
        QfhcyYhSr8JHeTCPKlIAPd7vB4JnTCc=
X-Google-Smtp-Source: AHgI3IbTdBBTTiearoO6vZA09lpxSZ5tqvL7vaFhG4nEdN22ck0YdB8exVWWIRzq5tK6DI6tecVS3w==
X-Received: by 2002:ac2:5303:: with SMTP id c3mr5422523lfh.97.1550049731388;
        Wed, 13 Feb 2019 01:22:11 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id h22-v6sm3349172ljh.89.2019.02.13.01.22.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 01:22:10 -0800 (PST)
Date:   Wed, 13 Feb 2019 10:22:10 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
Message-ID: <20190213092210.GG31044@bigcity.dyn.berto.se>
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
 <20190210133926.GD31044@bigcity.dyn.berto.se>
 <d6d064f2-fa58-d31e-83b8-1cc3ffbc7dee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6d064f2-fa58-d31e-83b8-1cc3ffbc7dee@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On 2019-02-10 17:39:34 +0100, Marek Vasut wrote:
> On 2/10/19 2:39 PM, Niklas Söderlund wrote:
> > Hi Wolfram,
> 
> Hi,
> 
> > Thanks for your patch.
> > 
> > On 2019-02-08 20:30:02 +0100, Wolfram Sang wrote:
> >> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
> >>
> >> SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
> >> according to the mode. If it is inappropriate, CRC error tends to occur.
> >>
> >> This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
> >> as needed.
> >>
> >> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> >> [wsa: rebased to upstream and updated commit message]
> >> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > I think this looks good.
> > 
> > Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Can you test this on E3 Ebisu (do you have a board) ?

I do not have a E3 so I'm afraid I can not provide a tested by tag for 
that board.

-- 
Regards,
Niklas Söderlund
