Return-Path: <SRS0=pjbC=4T=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7005C3F2D7
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  2 Mar 2020 20:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8538F214DB
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  2 Mar 2020 20:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgCBUML (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 2 Mar 2020 15:12:11 -0500
Received: from ms.lwn.net ([45.79.88.28]:58520 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgCBUMK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 15:12:10 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 45B1A823;
        Mon,  2 Mar 2020 20:12:10 +0000 (UTC)
Date:   Mon, 2 Mar 2020 13:12:09 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: nfsroot.rst: Fix references to
 nfsroot.rst
Message-ID: <20200302131209.12825f9a@lwn.net>
In-Reply-To: <CAMuHMdXjafF4s6U=mD6jEWDgx8CsmRsHiQOEVWmye87=soMz-Q@mail.gmail.com>
References: <20200212181332.520545-1-niklas.soderlund+renesas@ragnatech.se>
        <CAMuHMdXjafF4s6U=mD6jEWDgx8CsmRsHiQOEVWmye87=soMz-Q@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Feb 2020 19:30:37 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Wed, Feb 12, 2020 at 7:15 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > When converting and moving nfsroot.txt to nfsroot.rst the references to
> > the old text file was not updated to match the change, fix this.
> >
> > Fixes: f9a9349846f92b2d ("Documentation: nfsroot.txt: convert to ReST")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>  
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

jon
