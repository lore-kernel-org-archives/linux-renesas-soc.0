Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:19679 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934861AbdCJNFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:05:37 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC 2/2] usb: host: ehci-platform: set hcd->phy to avoid
 phy_get() in usb_add_hcd()
Date: Fri, 10 Mar 2017 13:05:31 +0000
Message-ID: <HK2PR06MB1634ED0C514EB97BD1756A1CD8200@HK2PR06MB1634.apcprd06.prod.outlook.com>
References: <1489150886-27862-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1489150886-27862-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1489150886-27862-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> From: Yoshihiro Shimoda, Sent: Friday, March 10, 2017 10:01 PM

Oops, this subject should be ohci-platform, not ehci-platform...

Best regards,
Yoshihiro Shimoda
