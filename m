Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36114 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbdCPDSb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Mar 2017 23:18:31 -0400
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        matthew@giassa.net
Subject: [PATCHv5 0/4] Staging: ks7010: ks_wlan_ioctl.h: checkpatch fixes
Date: Wed, 15 Mar 2017 20:18:07 -0700
Message-Id: <1489634291-30028-1-git-send-email-matthew@giassa.net>
In-Reply-To: <20170316024246.GA19641@kroah.com>
References: <20170316024246.GA19641@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The following patches address all outstanding checkpatch warnings/errors
present in drivers/staging/ks7010/ks_wlan_ioctl.h.

This change set has been rebased off of the current master
(69eea5a4ab9c705496e912b55a9d312325de19e6) as per an earlier request,
and the change log formatting has been slightly changed, as per Tobin's
advice.
