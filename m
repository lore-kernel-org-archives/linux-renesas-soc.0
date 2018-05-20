Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41412 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750914AbeETGpx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 02:45:53 -0400
Date: Sun, 20 May 2018 08:45:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: mux: demux-pinctrl: add symlinks to the demux
 device in sysfs
Message-ID: <20180520064551.zjwnnd3v4qoobuio@ninjato>
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
 <20180430115544.22903-3-wsa+renesas@sang-engineering.com>
 <9acf7b0c-d390-1bde-5f00-fcaa5a01f27b@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9acf7b0c-d390-1bde-5f00-fcaa5a01f27b@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> > +	sysfs_create_link(&priv->cur_adap.dev.kobj, &priv->dev->kobj,
> > +			       "demux_device");
> > +	sysfs_create_link(&priv->dev->kobj, &priv->cur_adap.dev.kobj,
> > +			       "channel-0");
> > +
> 
> From sysfs.h:
> int __must_check sysfs_create_link(...);

Darn, right... Will fix!
