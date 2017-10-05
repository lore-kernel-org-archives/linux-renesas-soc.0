Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33938 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdJEJX6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 05:23:58 -0400
Date: Thu, 5 Oct 2017 11:23:38 +0200
From: Simon Horman <horms@verge.net.au>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm: dts: gr-peach: Fix label indent
Message-ID: <20171005092338.GU26369@verge.net.au>
References: <1507131702-6504-1-git-send-email-jacopo+renesas@jmondi.org>
 <cccbcde1-9666-7edd-3cbe-e097e211fb8a@cogentembedded.com>
 <20171005084147.GO4037@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171005084147.GO4037@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 05, 2017 at 10:41:47AM +0200, jacopo mondi wrote:
> Hi Simon, Sergei
> 
> On Wed, Oct 04, 2017 at 07:03:35PM +0300, Sergei Shtylyov wrote:
> > On 10/04/2017 06:41 PM, Jacopo Mondi wrote:
> >
> > >Fix 'leds' label indent as it was wrongly aligned
> >
> >    It's not a label, it's node name. :-)
> 
> You're so right!
> As I have other 3 patches to send out for GR-Peach, I will re-phrase
> this and re-send it in the forth-coming series, so that Simon doesn't
> have to mangle the commit message when picking this up.

Thanks, I'll watch out for the new version.
