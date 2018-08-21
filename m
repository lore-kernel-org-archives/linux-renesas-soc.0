Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:45501 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbeHVCHa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 22:07:30 -0400
MIME-Version: 1.0
In-Reply-To: <20180821220233.9202-6-wsa+renesas@sang-engineering.com>
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com> <20180821220233.9202-6-wsa+renesas@sang-engineering.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Aug 2018 19:45:24 -0300
Message-ID: <CAOMZO5AkVNiYMGdED9erL=YMaKcmtS5BzZxw2gO1KLXEaPnD7A@mail.gmail.com>
Subject: Re: [PATCH 05/11] can: rcar: use SPDX identifier for Renesas drivers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Philippe Ombredanne <pombredanne@nexb.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Aug 21, 2018 at 7:02 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> To be applied individually per subsystem tree. Morimoto-san, could you maybe
> ack this with your Renesas address?
>
>  drivers/net/can/rcar/rcar_can.c   | 6 +-----
>  drivers/net/can/rcar/rcar_canfd.c | 6 +-----
>  2 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/can/rcar/rcar_can.c b/drivers/net/can/rcar/rcar_can.c
> index 11662f479e76..051bf4ef4be2 100644
> --- a/drivers/net/can/rcar/rcar_can.c
> +++ b/drivers/net/can/rcar/rcar_can.c
> @@ -1,12 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

According to Documentation/process/license-rules.rst the format should
be like this instead:

// SPDX-License-Identifier: GPL-2.0+
