Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33535 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752755AbdFVJGc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2017 05:06:32 -0400
Date: Thu, 22 Jun 2017 11:06:30 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: algo-bit: add support for I2C_M_STOP
Message-ID: <20170622110630.42eae574@endymion>
In-Reply-To: <20170621145426.yeourbp3coddjwmu@ninjato>
References: <20170621092402.773a4b14@endymion>
        <20170621145426.yeourbp3coddjwmu@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 21 Jun 2017 16:54:26 +0200, Wolfram Sang wrote:
> > +				if (msgs[i - 1].flags & I2C_M_STOP) {
> > +					bit_dbg(3, &i2c_adap->dev,
> > +						"emitting enforced stop condition\n");
> > +					i2c_stop(adap);
> > +					bit_dbg(3, &i2c_adap->dev,
> > +						"emitting start condition\n");  
> 
> Do you mind if I combine the two debug outputs into one?
> 
> > +					bit_dbg(3, &i2c_adap->dev,
> > +						"emitting enforced stop/start condition\n");  
> 

Go ahead, fine with me.

-- 
Jean Delvare
SUSE L3 Support
