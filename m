Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthew Giassa <matthew@giassa.net>
To: wsa@the-dreams.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCHv3] checkpatch fixes for drivers/staging/ks7010/ks_wlan_ioctl.h
Date: Sun, 26 Feb 2017 18:00:18 -0800
Message-Id: <1488160822-18751-1-git-send-email-matthew@giassa.net>
In-Reply-To: <1487650805-30520-1-git-send-email-matthew@giassa.net>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Assembling a set of patches to address all outstanding checkpatch issues in
staging/drivers/ks7010/ks_wlan_ioctl.h to replace my earlier v2 work which
attempted to do all of this in a single patch. This includes wrapping macros
with complex values in parentheses, removing extraneous/mixed whitespace
characters, and changing the alignment of parameters in function prototypes.
