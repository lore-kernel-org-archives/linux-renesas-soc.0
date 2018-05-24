Return-Path: <linux-i2c-owner@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: improve error message for failed symlink
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180521073413.3423-1-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <267ef8d2-129d-8bfb-e409-5302645625f3@axentia.se>
Date: Thu, 24 May 2018 14:01:52 +0200
MIME-Version: 1.0
In-Reply-To: <20180521073413.3423-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-21 09:34, Wolfram Sang wrote:
> Trivial, but still: the failed symlink is not *for* the channel but a
> link *to* the channel.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to i2c-mux/for-next.

Cheers,
Peter
