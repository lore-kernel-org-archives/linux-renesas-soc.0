Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35534 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751980AbeEGMld (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 08:41:33 -0400
Date: Mon, 7 May 2018 14:41:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 2/3] mmc: renesas_sdhi: Add r8a77965 support
Message-ID: <20180507124129.thylvld2jzzpf2au@verge.net.au>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-3-git-send-email-ykaneko0929@gmail.com>
 <20180501152915.66re3hotavdy2bi6@verge.net.au>
 <20180502053218.2idc2kfzfksuz74b@tetsubishi>
 <20180502063506.3s4vizhm5aquklrh@verge.net.au>
 <20180502081415.amyes57huzb5ozlq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180502081415.amyes57huzb5ozlq@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 02, 2018 at 10:14:15AM +0200, Wolfram Sang wrote:
> 
> > With the current state of the driver this patch should be fine,
> > modulo the changes suggested above. But once HS400 support is merged
> > some logic will be required to disable that feature for the r8a77965
> > until HS400 support for that SoC is explicitly added.
> > 
> > Or conversely, perhaps when HS400 is added it should only be enabled
> > in the driver for SoCs that are known to work: r8a7796 and r8a7795. In the
> > case of the latter perhaps only ES2.0.
> > 
> > Wolfram, what do you think?
> 
> M3-N (and future SoCs as it seems) has 8 taps while the others have 4.
> Maybe we should have something already in place to distinguish 8 taps
> and 4 taps and leave the 8 taps part for "to be added later"?

Yes, that is one option.
