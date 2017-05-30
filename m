Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34807 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbdE3Kri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2017 06:47:38 -0400
MIME-Version: 1.0
In-Reply-To: <20170522073943.GA469@jagdpanzerIV.localdomain>
References: <20170522073943.GA469@jagdpanzerIV.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 May 2017 12:47:36 +0200
Message-ID: <CAMuHMdVdbQ+8py3ZLhcQM7_vJnNnxzjP50qniP+iZ0QTVuJRVg@mail.gmail.com>
Subject: Re: [linux-next / tty] possible circular locking dependency detected
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Jiri Slaby <jslaby@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 22, 2017 at 9:39 AM, Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> [ 1274.378287] ======================================================
> [ 1274.378289] WARNING: possible circular locking dependency detected
> [ 1274.378290] 4.12.0-rc1-next-20170522-dbg-00007-gc09b2ab28b74-dirty #1317 Not tainted
> [ 1274.378291] ------------------------------------------------------
> [ 1274.378293] kworker/u8:5/111 is trying to acquire lock:
> [ 1274.378294]  (&buf->lock){+.+...}, at: [<ffffffff812f2831>] tty_buffer_flush+0x34/0x88
> [ 1274.378300]
>                but task is already holding lock:
> [ 1274.378301]  (&o_tty->termios_rwsem/1){++++..}, at: [<ffffffff812ee5c7>] isig+0x47/0xd2
> [ 1274.378307]
>                which lock already depends on the new lock.
>
> [ 1274.378309]
>                the existing dependency chain (in reverse order) is:
> [ 1274.378310]
>                -> #2 (&o_tty->termios_rwsem/1){++++..}:
> [ 1274.378316]        lock_acquire+0x183/0x1ae
> [ 1274.378319]        down_read+0x3e/0x62
> [ 1274.378321]        n_tty_write+0x6c/0x3d6
> [ 1274.378322]        tty_write+0x1cc/0x25f
> [ 1274.378325]        __vfs_write+0x26/0xec
> [ 1274.378327]        vfs_write+0xe1/0x16a
> [ 1274.378329]        SyS_write+0x51/0x8e
> [ 1274.378330]        entry_SYSCALL_64_fastpath+0x18/0xad
> [ 1274.378331]
>                -> #1 (&tty->atomic_write_lock){+.+.+.}:
> [ 1274.378335]        lock_acquire+0x183/0x1ae
> [ 1274.378337]        __mutex_lock+0x95/0x7ba
> [ 1274.378339]        mutex_lock_nested+0x1b/0x1d
> [ 1274.378340]        tty_port_default_receive_buf+0x4e/0x81
> [ 1274.378342]        flush_to_ldisc+0x87/0xa1
> [ 1274.378345]        process_one_work+0x2be/0x52b
> [ 1274.378346]        worker_thread+0x1f3/0x2c5
> [ 1274.378349]        kthread+0x131/0x139
> [ 1274.378350]        ret_from_fork+0x2e/0x40
> [ 1274.378351]
>                -> #0 (&buf->lock){+.+...}:
> [ 1274.378355]        __lock_acquire+0xec4/0x1444
> [ 1274.378357]        lock_acquire+0x183/0x1ae
> [ 1274.378358]        __mutex_lock+0x95/0x7ba
> [ 1274.378360]        mutex_lock_nested+0x1b/0x1d
> [ 1274.378362]        tty_buffer_flush+0x34/0x88
> [ 1274.378364]        pty_flush_buffer+0x27/0x70
> [ 1274.378366]        tty_driver_flush_buffer+0x1b/0x1e
> [ 1274.378367]        isig+0x9b/0xd2
> [ 1274.378369]        n_tty_receive_signal_char+0x1c/0x59
> [ 1274.378371]        n_tty_receive_char_special+0xa4/0x740
> [ 1274.378373]        n_tty_receive_buf_common+0x452/0x810
> [ 1274.378374]        n_tty_receive_buf2+0x14/0x16
> [ 1274.378376]        tty_ldisc_receive_buf+0x1f/0x4a
> [ 1274.378377]        tty_port_default_receive_buf+0x5f/0x81
> [ 1274.378379]        flush_to_ldisc+0x87/0xa1
> [ 1274.378380]        process_one_work+0x2be/0x52b
> [ 1274.378382]        worker_thread+0x1f3/0x2c5
> [ 1274.378383]        kthread+0x131/0x139
> [ 1274.378385]        ret_from_fork+0x2e/0x40
> [ 1274.378386]
>                other info that might help us debug this:

JFTR, I'm also seeing this on various arm/arm64 platforms.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
