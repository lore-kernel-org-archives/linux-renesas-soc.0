Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34783 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753168AbdERIw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 04:52:56 -0400
Date: Thu, 18 May 2017 10:52:53 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] i2c-stub: make it usable with DT when booting
Message-ID: <20170518105253.058a90a6@endymion>
In-Reply-To: <20170516112758.2842-1-wsa+renesas@sang-engineering.com>
References: <20170516112758.2842-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, 16 May 2017 13:27:58 +0200, Wolfram Sang wrote:
> This patch makes the stub driver parse the device tree when booting and
> create a virtual bus with the desired devices attached. Here is an
> example DTS snipplet making use of it. It is for simulating a more
> complex camera device which has dependencies which needs to be sorted
> out at boot time:
> 
> i2c@42 {
> 	compatible = "i2c-stub";
> 
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	des@4c {
> 		compatible = "maxim,max9268";
> 		reg = <0x4c>;
> 	};
> 
> 	eeprom@57 {
> 		compatible = "atmel,24c02";
> 		reg = <0x57>;
> 	};
> };

I get the idea and I understand the need to emulate the devices early
in the boot process. However, how do you deal with the I2C devices
pre-initialization (setting initial register values)? This is typically
done in user-space with the i2c-stub-from-dump script, or manual calls
to i2cset, but that would be too late in your case, wouldn't it?

> 
> FIXME: can fw_* calls be used instead of of_*?
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> It was really useful when developing. When using fw_* calls, we probably could
> make use of it with ACPI as well. Still, calling for opinions if we want this
> upstream or if we want to stay module-only? Also, the binding should really
> be marked as "development only". Or is it better to keep it as a separate
> patch to keep the binding un-official?

Code looks sane, but I can't comment on the bindings side of things as
this isn't my area.

-- 
Jean Delvare
SUSE L3 Support
