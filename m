Return-Path: <SRS0=zvdX=WK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F03C0650F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 14 Aug 2019 08:21:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 373B02084D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 14 Aug 2019 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565770904;
	bh=0SRQvKfJI3KkDlXjXO2Kc45qqR2l8qAvwyBNJ3EauSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FN4Jghl0K/arwsBf2MxbNFkSatkk07+9/eNw9UlTkxV4xfM3Zk1gW5SsPft8p3OkI
	 MHVYH45lYyPAvc03VkjEZzykWbbIMd9pMVz0Idn6Vl1HmFwaf0sTvCUYssxRnsADsM
	 THjKugeXXcPFC9f8BJkveuD/kwTc8juPvtMB4p8M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfHNIVo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 14 Aug 2019 04:21:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbfHNIVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 04:21:43 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D66D2205F4;
        Wed, 14 Aug 2019 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565770902;
        bh=0SRQvKfJI3KkDlXjXO2Kc45qqR2l8qAvwyBNJ3EauSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VqwKYA4dxWwl5KdIgbbEGxSbzBCtTPc8D7OA4hW+38+nBOg3nvYBm0l4OYM24arDQ
         03ylO7A2ZW3aqU+Blbj0SLEXQjAdCChO/fmggrlqvm7gYfAYOrfS7usUPyhTboA4JP
         sTgYJDLr5AtEAHr+2QWJElTlITPDw0JLK0nQjFBo=
Date:   Wed, 14 Aug 2019 09:21:37 +0100
From:   Will Deacon <will@kernel.org>
To:     Bhupesh Sharma <bhsharma@redhat.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Steve Capper <steve.capper@arm.com>,
        Christoph von Recklinghausen <crecklin@redhat.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>, maz@kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V5 00/12] 52-bit kernel + user VAs
Message-ID: <20190814082137.mnk242lp2vw5b4ot@willie-the-truck>
References: <20190807155524.5112-1-steve.capper@arm.com>
 <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
 <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
 <20190813131013.vpc5a2vlxwghizxa@willie-the-truck>
 <CAMuHMdXr+S2QeOSEXZoGGDOB_PrgENPbVXFjS=pEfbHfvN2zhw@mail.gmail.com>
 <CACi5LpNhh0a0ktLeDDCO4K3-mBx0D8QZ344juAzbHeP4QFtGDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACi5LpNhh0a0ktLeDDCO4K3-mBx0D8QZ344juAzbHeP4QFtGDw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 14, 2019 at 01:34:49PM +0530, Bhupesh Sharma wrote:
> I still see the following issue on a 48-bit hardware (i.e. _non_
> ARMv8.2 hardware) with branch 'for-next/52-bit-kva' with commit
> d2d73d2fef421ca0d4 as the HEAD:

Have you tried the patches I posted here:

http://lists.infradead.org/pipermail/linux-arm-kernel/2019-August/673315.html

?

Whilst they're being reviewed, I've dropped the 52-bit branch from
linux-next (for-next/core) so that people don't keep running into this.

Will
