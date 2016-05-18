Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:36148 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753324AbcERO3I (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 10:29:08 -0400
To: <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Hard coded register address in "drm: rcar-du: Add DPLL support"?
Message-ID: <9fc07c0c-0760-a713-5ca0-c70861576467@de.bosch.com>
Date: Wed, 18 May 2016 16:29:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

I'm not sure on which mailing list this

https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/drivers/gpu/drm/rcar-du/rcar_du_crtc.c?h=topic/gen3-latest&id=e297be92f09a9e8f9a63e72b8d69440dbf5bbabe
drm: rcar-du: Add DPLL support

is discussed.

But it's the same like with the hard coded MODEMR register: We don't 
want the hard coded

#define PRODUCT_REG 0xfff00044

here.

Are there already patches or plans to convert this to a device tree 
based interface?

Best regards

Dirk
