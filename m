Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:33943 "EHLO
	mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788AbcFADRa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 23:17:30 -0400
Received: by mail-vk0-f48.google.com with SMTP id c189so9432896vkb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 May 2016 20:17:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1464665528-11398-1-git-send-email-horms+renesas@verge.net.au>
References: <1464665528-11398-1-git-send-email-horms+renesas@verge.net.au>
Date: Wed, 1 Jun 2016 12:17:29 +0900
Message-ID: <CANqRtoTRRNQGk-gy1NrQhXNB0fzvkHDxwJGxyQHTYAgHUXm9ZA@mail.gmail.com>
Subject: Re: [RFC 0/4] ARM: dts: r8a7790: lager: use demuxer for I2C
From: Magnus Damm <magnus.damm@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, May 31, 2016 at 12:32 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> the intention of this series is to extend use of the demuxer for I2C
> on the lager/r8a7790 to cover all I2C IP blocks.
>
> This is based on work by Wolfram Sang.
>
> I have not included GPIO in the demux configuration. This is in keeping
> with the existing usage for IIC0/I2C0.

Thanks for your efforts! Can you please include GPIO support in next
version? This way we should in the future be able to use
distro-kernels out of the box that may only have GPIO bitbang support
enabled.

Cheers,

/ magnus
