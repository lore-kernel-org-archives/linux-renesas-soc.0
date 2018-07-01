Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:37408 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030899AbeGAR1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Jul 2018 13:27:43 -0400
Received: by mail-io0-f182.google.com with SMTP id s26-v6so12758660ioj.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 01 Jul 2018 10:27:43 -0700 (PDT)
Subject: Re: [PATCH 4/4] serial: sh-sci: Stop RX FIFO timer during port
 shutdown
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20180629142513.20743-1-geert+renesas@glider.be>
 <20180629142513.20743-8-geert+renesas@glider.be>
From: Rob Landley <rob@landley.net>
Message-ID: <c3d1884b-baab-241d-e4ee-745ed87dbb3b@landley.net>
Date: Sun, 1 Jul 2018 12:27:40 -0500
MIME-Version: 1.0
In-Reply-To: <20180629142513.20743-8-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/29/2018 09:25 AM, Geert Uytterhoeven wrote:
> The RX FIFO timer may be armed when the port is shut down, hence the
> timer function may still be called afterwards.
> 
> Fix this race condition by deleting the timer during port shutdown.

Will any of this make the qemu-system-sh4 serial console work again?

Rob
