Return-Path: <linux-i2c-owner@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: mux: demux-pinctrl: add symlinks to the demux
 device in sysfs
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
 <6641706f-fe9e-8d92-48c5-ebd4453c51c3@axentia.se>
 <20180522191325.luqgcfhxlzg3j4ho@ninjato>
From: Peter Rosin <peda@axentia.se>
Message-ID: <4f283ee0-af31-db44-f862-96b224b6f8ae@axentia.se>
Date: Thu, 24 May 2018 13:55:57 +0200
MIME-Version: 1.0
In-Reply-To: <20180522191325.luqgcfhxlzg3j4ho@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-22 21:13, Wolfram Sang wrote:
> Hi Peter,
> 
>> Hmm, now that I have slept on it, I find this a bit odd. For muxes, all
>> channels and the parent are always present. Here, that is not the case.
>> And don't get me wrong, I see why that is the case, but that doesn't
>> mean that I like it. It would be so much nicer and less disruptive if
>> the client devices were not unbound and rebound (which I think they are,
>> right?) on every master switch.
> 
> Yes, we rebind on every master switch. In the first iteration of this
> driver, I tried the on-the-fly approach. It turned out to be very flaky
> because it was stretching the driver model too much. There is no support
> for multiple parents and no support for switching the parent at runtime.
> When trying to do that, you find out that e.g. the whole relationship
> tree needs to be rebuilt, say to keep PM hierarchy consistent. And even,
> just for I2C, on-the-fly switching is not really supported. Some Renesas
> R-Car SoCs have two different I2C IP cores which can be muxed to the
> same pins. One has DMA, the other slave functionality. I don't see a way
> to combine both into one "virtual" master. This is why I came to the
> current approach. The use case that the customers decide on the feature
> set they want to use after booting was said to be good enough.
> 
>> In some cases I think it might be possible to make the switch automatic
>> and seamless, e.g. if there are two masters and one of them is faster
>> but has some glitch(es), and the other is slower but complete (or at
>> least complete enough).
> 
> That might work for some cases, yet I'd favor a generic solution.
> 
>> What do you think?
> 
> Given my above experiences, I'd just drop the channel symlink and keep
> the driver as is :)

Ok, I'm dropping this patch.

> But thanks for thinking about it!

No problem.

Cheers,
Peter
