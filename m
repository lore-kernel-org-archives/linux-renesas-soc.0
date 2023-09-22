Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56310E7D0D2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Sep 2023 06:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjIVGqG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Sep 2023 02:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjIVGqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2023 02:46:05 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D540F102
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=P209lUPPFk5mfM
        w91tLgw5JIrd9mLWDy2MCMSCAaG5Y=; b=BSsuYEadNC6G2ywAF+TpzNZTR4NhXo
        lJFC501Xtq9dk+8EpD/tYtCTAtF46zwk4TkZPxyIfhqSE4y4oLOZggtpGhZ6HVWG
        8Eo6mAPCFPiSbMXsVihqRX8DljaA3tpk1FOVFpkEeljJrl/GbSILzAsajmTI4cRV
        TbnkWEMTvad7ElGZNert7jvMOghekFUl65rCWi4lKfmOFzAgnvcOHee2rOoCPiHX
        FzbjFCBmX+dpSxbGeaHNpi/Nex0ovG5wFM57cYupZTdw6vw2FvwReBBOZWSVgmRJ
        GhVddCD4PFDK9+aEjHtSMU63m2bwo0d4mLtr7tG+P9CzaAp0o0/OWx/Q==
Received: (qmail 1279089 invoked from network); 22 Sep 2023 08:45:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 08:45:57 +0200
X-UD-Smtp-Session: l3s3148p1@4mHx9ewFCuUujntX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: remove boilerplate from header file
Date:   Fri, 22 Sep 2023 08:45:51 +0200
Message-Id: <20230922064551.4663-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is a SPDX entry, so we can remove the boilerplate.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/usb/renesas_usbhs.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index d418c55523a7..372898d9eeb0 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -5,16 +5,6 @@
  * Copyright (C) 2011 Renesas Solutions Corp.
  * Copyright (C) 2019 Renesas Electronics Corporation
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 #ifndef RENESAS_USB_H
 #define RENESAS_USB_H
-- 
2.35.1

