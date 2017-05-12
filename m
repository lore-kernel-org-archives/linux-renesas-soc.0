Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38007 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755196AbdELMYM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 08:24:12 -0400
Received: by mail-wm0-f49.google.com with SMTP id 142so70565530wma.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 May 2017 05:24:11 -0700 (PDT)
Date: Fri, 12 May 2017 14:24:09 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] ravb: add wake-on-lan support via
 magic packet
Message-ID: <20170512122409.GE31437@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider pulling this for the next renesas-drivers release. I 
will include this in my for-renesas-drivers branch which I will base on 
4.12-rc1. So feel free to choose to only pull that one and ignore this.

The following changes since commit a351e9b9fc24e982ec2f0e76379a49826036da12:

  Linux 4.11 (2017-04-30 19:47:48 -0700)

are available in the git repository at:

  https://git.ragnatech.se/linux tags/ravb-wol-v1

for you to fetch changes up to 9f65f8c7006a80f6c8b56d0367fbd077c5551944:

  ravb: add wake-on-lan support via magic packet (2017-05-11 22:39:59 +0200)

----------------------------------------------------------------
Niklas S�derlund (1):
      ravb: add wake-on-lan support via magic packet

 drivers/net/ethernet/renesas/ravb.h      |   2 +
 drivers/net/ethernet/renesas/ravb_main.c | 108 +++++++++++++++++++++++++++++--
 2 files changed, 106 insertions(+), 4 deletions(-)


-- 
Regards,
Niklas S�derlund
