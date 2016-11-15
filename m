Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:33139 "EHLO
        mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751359AbcKOL4V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 06:56:21 -0500
Received: by mail-yw0-f174.google.com with SMTP id r204so91611339ywb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2016 03:56:20 -0800 (PST)
MIME-Version: 1.0
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Tue, 15 Nov 2016 12:56:14 +0100
Message-ID: <CAO3366ziaB9q5Q9azj8tnL+c4XkEHQ7i+afn-FjtzF=cjYRv4w@mail.gmail.com>
Subject: ALSA analog audio loopback test tool (atest)
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

I have just pushed atest (https://github.com/uli/atest). It's a tool
to automatically verify operation of analog audio hardware remotely
(i.e. without being able to listen to the output) using a loopback
cable between the analog audio input and output.

It works by sending a message encoded by a HAM radio codec (Q15X25)
out on the output and decoding whatever arrives at the input. It sends
a different message on every channel and can thus detect if channels
are swapped around.

Details on using it (especially on how to set up the mixers) can be
found in the README file. Have fun!

CU
Uli
