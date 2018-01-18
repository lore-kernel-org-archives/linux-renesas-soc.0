Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52588 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755005AbeARJl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jan 2018 04:41:26 -0500
Received: from penelope.horms.nl (unknown [217.111.208.18])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 610FA25B776
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jan 2018 20:41:24 +1100 (AEDT)
Date: Thu, 18 Jan 2018 10:41:22 +0100
From: Simon Horman <horms@verge.net.au>
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [ANNOUNCE] Renesas tree closing schedule for v4.16
Message-ID: <20180118094122.ldnusepks3io26ez@verge.net.au>
References: <20171220092604.wdw6ya64heqt7jao@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171220092604.wdw6ya64heqt7jao@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 20, 2017 at 10:26:04AM +0100, Simon Horman wrote:
> Hi,
> 
> I would like to close the Renesas tree for non-bug submissions for v4.16 on
> Friday the 22nd December (this Friday, I work on GMT +0200).
> 
> This is a few days earlier than would otherwise be the case due to the
> holiday season.
> 
> If this is has caught you by surprise and is going to be a large problem
> for you please let me know ASAP so we can discuss.

Hi Again,

I did close my tree for v4.16 as described above and send pull-requests
accordingly.

Unfortunately I also continued to accept new patches into for-v4.16
branches which propagated into the next branch and in turn linux-next tree.
I have rectified this by moving all the relevant patches into for-v4.17
branches and excluding them from the next branch. They are still all
present in the devel branch and are on track for v4.17.

These changes are visible in the renesas-next-20180118-v4.15-rc1 and
renesas-devel-20180118-v4.15-rc8 tags.

Sorry for any confusion this may have caused.
