Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:41485 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652AbcHJVzr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 10 Aug 2016 17:55:47 -0400
Date: Wed, 10 Aug 2016 14:55:46 -0700 (PDT)
Message-Id: <20160810.145546.383556730317744645.davem@davemloft.net>
To: geert@linux-m68k.org
Cc: u.kleine-koenig@pengutronix.de, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] net: ipconfig: fix use after free
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAMuHMdV=MsCUzuGJ76jWaw7kmMm7o1c3Dvpn50rCaJ2a7wS2iw@mail.gmail.com>
References: <CAMuHMdVjugL0y-C+vet=qbcER8rjuFKwFgrutRUAs=uOk0JZ1A@mail.gmail.com>
	<1470822257-13275-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<CAMuHMdV=MsCUzuGJ76jWaw7kmMm7o1c3Dvpn50rCaJ2a7wS2iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Aug 2016 12:00:35 +0200

> Hi Uwe,
> 
> On Wed, Aug 10, 2016 at 11:44 AM, Uwe Kleine-K�nig
> <u.kleine-koenig@pengutronix.de> wrote:
>> ic_close_devs() calls kfree() for all devices's ic_device. Since commit
>> 2647cffb2bc6 ("net: ipconfig: Support using "delayed" DHCP replies")
>> the active device's ic_device is still used however to print the
>> ipconfig summary which results in an oops if the memory is already
>> changed. So delay freeing until after the autoconfig results are
>> reported.
> 
> Thanks!
> 
>> Fixes: 2647cffb2bc6 ("net: ipconfig: Support using "delayed" DHCP replies")
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks everyone.
