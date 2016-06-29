Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47647 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752073AbcF2MUe (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 08:20:34 -0400
Date: Wed, 29 Jun 2016 14:20:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] ARM: dts: renesas: Update console parameters
Message-ID: <20160629122003.GA16036@verge.net.au>
References: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 14, 2016 at 04:15:19PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series updates the console parameters in the DTSes for
> various Renesas ARM boards.
> 
>   - For all of them, the serial port config is added to
>     chosen/stdout-path, as per current best practices,
>   - On some boards (armadillo, genmai, kzm9g), the console alias is
>     changed to "serial0", for consistency with other boards, and to
>     match current best practices (the first serial port should be called
>     "serial0", unless labeled otherwise).
>     This does mean the device changes its name to /dev/ttySC0 in
>     userspace.  I believe it's OK to make this change, as we did the
>     same for koelsch, lager, and marzen before.
>   - On some boards (armadillo, kzm9d, kzm9g), "console=" parameters are
>     removed from the kernel command lines, as they're no longer needed
>     for DT-only platforms.
>     Beware leftover parameters in bootargs environment variables!
>   - On kzm9d, a console alias is added.
> 
> Changes compared to v1:
>   - Drop patches that have been applied,
>   - Change one-line summary prefixes to match current arm-soc practices,
>   - Drop name changes of pfc subnodes,
>   - Reword patch descriptions.
> 
> Dependencies:
>   - Due to dropping the name changes of pfc subnodes, this has an
>     esthetic (never realized before this does exist ;-) dependency on
>     "[PATCH 00/19] ARM: dts: renesas: Name pfc subnodes after device
>     names".
> 
> Tested on all five affected boards (some with remote access), to verify
> there is no other impact to userspace than the change of the console
> device to /dev/ttySC0, which may be handled automatically, depending on
> your userspace.
> 
> Thanks for applying!

Thanks, I have tentatively queued this up.
