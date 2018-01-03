Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52713 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752051AbeACKU4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 05:20:56 -0500
Date: Wed, 3 Jan 2018 11:20:52 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Mark rcar_sysc_matches[]
 __initconst
Message-ID: <20180103102051.m2ohp5fuihkb755c@verge.net.au>
References: <1513698884-26663-1-git-send-email-geert+renesas@glider.be>
 <20171220082527.k7wldjwjxut3j4xz@verge.net.au>
 <CAMuHMdXGVM1qkBNPDN_rrN5mby-iGy8s8VgEz_KmYswmufVohQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXGVM1qkBNPDN_rrN5mby-iGy8s8VgEz_KmYswmufVohQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 02, 2018 at 03:50:19PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Dec 20, 2017 at 9:25 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Dec 19, 2017 at 04:54:44PM +0100, Geert Uytterhoeven wrote:

...

> Thank you.
> Please note this is a patch intended for your soc-for-v4.16 branch ;-)

Thanks, I had missed that important detail.
I have applied it to that branch.
