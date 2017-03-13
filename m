Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 14 Mar 2017 05:53:34 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Giassa <matthew@giassa.net>
Cc: wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Formatting updates to remove checkpatch warnings in
 ks_wlan_ioctl.h.
Message-ID: <20170313215333.GA13395@kroah.com>
References: <1488750740-2091-1-git-send-email-matthew@giassa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488750740-2091-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Mar 05, 2017 at 01:52:19PM -0800, Matthew Giassa wrote:
> Implementing some minor formatting changes to remove checkpatch warnings.
> Removing space-hardtab instances. Removing C++-style line comments in favor of
> C-style equivalent. Re-aligning function prototype arguments to remove related
> checkpatch warning.

That is a lot of different things to do all at once, please break this
up into one logical patch per "thing" you do.

Also, fix up your subject line to match how other patches for this
subsystem/driver look, git log will show you what to do there.

thanks,

greg k-h
