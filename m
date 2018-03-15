Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751612AbeCORXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 13:23:04 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CAMuHMdVPXzJcJLkdH2+Qzz11dT95=3FrgZUR9n4Co7mC=7vEig@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <1519985872-3809-1-git-send-email-geert+renesas@glider.be>
 <152106382662.179530.17640698731932597086@swboyd.mtv.corp.google.com>
 <CAMuHMdVPXzJcJLkdH2+Qzz11dT95=3FrgZUR9n4Co7mC=7vEig@mail.gmail.com>
Message-ID: <152113458349.102315.6447333350800478011@swboyd.mtv.corp.google.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.17
Date: Thu, 15 Mar 2018 10:23:03 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-03-15 02:27:33)
> Hi Stephen,
> 
> On Wed, Mar 14, 2018 at 10:43 PM, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Did you need to use clk_readl() or was it just copy-paste? I hope we can
> > get rid of that function at some point.
> 
> That's an oversight. I will get rid of them in the second pull request
> for v4.17.
> 

Awesome. Thanks.
