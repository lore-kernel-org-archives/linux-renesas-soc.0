Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D574C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:01:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA0B9218A5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbfCOLBd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 07:01:33 -0400
Received: from sauhun.de ([88.99.104.3]:36816 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727059AbfCOLBd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 07:01:33 -0400
Received: from localhost (unknown [81.92.17.130])
        by pokefinder.org (Postfix) with ESMTPSA id 7C7812C3637;
        Fri, 15 Mar 2019 12:01:31 +0100 (CET)
Date:   Fri, 15 Mar 2019 12:01:31 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for
 max_req_size
Message-ID: <20190315110130.GA2148@kunai>
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
 <20190315082917.GA1176@kunai>
 <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
 <20190315092854.GB1176@kunai>
 <CAMuHMdVEdU9CLSMzJWiDn5brc8bXNBemma=Zk4XtF4wsXHeb7Q@mail.gmail.com>
 <20190315093941.GC1176@kunai>
 <CAMuHMdUmNSk3n1EEaYQpXV-Pwa3d9O8UDARx+zF5c_BYqrR5rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUmNSk3n1EEaYQpXV-Pwa3d9O8UDARx+zF5c_BYqrR5rg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> My worry here is that if several drivers would do
> 
>        .max_blk_count  = UINT_MAX / DRIVER_SPECIFIC_MAX_BLK_SIZE,
> 
> Those drivers can safely calculate "max_blk_size * max_blk_count".
> People may start assuming this is always safe. while the core cannot do
> "GLOBAL_MAX_BLK_SIZE * max_blk_count" using 32-bit arithmetic, as the
> latter may still overflow, depending on the driver.

The core will not do this calculation. This is why the variable
max_req_size exists. It will just use this variable which shall be setup
by the driver which may impose other restrictions, too (And there can't
be a GLOBAL_MAX_BLK_SIZE anyhow)

So, when calculating max_req_size, it is the duty of the driver not to
overflow. Or?

