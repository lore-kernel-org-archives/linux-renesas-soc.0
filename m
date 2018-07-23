Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:40943 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388049AbeGWKzm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 06:55:42 -0400
MIME-Version: 1.0
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
 <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com>
In-Reply-To: <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jul 2018 11:55:05 +0200
Message-ID: <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
Subject: Re: CCREE performance on R-Car H3 + crash
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gilad,

CC linux-crypto for the crash log.

On Sun, Jul 22, 2018 at 7:28 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Thu, Jul 19, 2018 at 3:43 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > I've noticed CCREE is used with a LUKS-formatted disk, so I did some small
> > performance benchmarks.  The disk is an old 160 GiB SATA hard drive,
> > connected to either Salvator-XS (R-Car H3 ES2.0) or Koelsch (R-Car M2-W).
> >
> > hdparm -t /dev/sda (unencrypted data): 62 MB/s (both systems)
> >
> > hdparm -t /dev/dm-0 (encrypted data, LUKS AES):
> >
> >     salvator-xs (CCREE): 15 MB/s
> >     salvator-xs (SW):    62 MB/s
> >     koelsch (SW):        47 MB/s
> >
> > I'm a bit disappointment by the results when using crypto acceleration.
> > Apparently the in-kernel optimized arm64 implementation can decrypt at
> > raw read speed, while CCREE can't keep up.
>
> Interesting. What is the encryption sector size used?

crypt_config.sector_size is 512.

> If it is he default of 512 bytes, you might want to try setting the
> new block_size DM-Crypt option. I believe it will have a large effect
> on the result.

Where do I specifiy that option? I couldn't find it.
Is that compatible with the encrypted media that's already in use?

> > Is this expected, and in line with your experiences?
>
> Well, if you were indeed using the default 512 bytes and taking into
> account that sadly the CryptoCell inside the R-Car is not wired to
> utilize a coherent bus (the cache invalidation costs a fortune in
> performance) it is not unexpected.
>
> When reasoning about these things it is worth taking into account that
> the design target of using CryptoCell is not to get the absolute best
> raw performance as such but rather to get good performance / per cycle
> / per watt.
>
> When the Arm AES Crypto Extension is used (I assume you are using that
> and not, say, the NEON implementation) I expect the raw performance to
> always be better than CryptoCell, certainly when it is not attached to
> a coherent bus. However, if you check CPU utilization during the
> operation (basically how much encryption is "stealing" computation
> power from the CPU) and subsequent power consumption you are supposed
> to see that there is a large area of work loads where it makes more
> sense to utilize CryptoCell for disk encryption and use the CPU for
> something else.

... in theory, at least. :-)

Sure, you have to consider raw performance vs. CPU utilization vs. power
consumption. Need more ways to tweak the kernel :-)

$ cryptsetup benchmark
# Tests are approximate using memory only (no storage IO).
PBKDF2-sha1       478364 iterations per second for 256-bit key
PBKDF2-sha256     927943 iterations per second for 256-bit key
PBKDF2-sha512     360583 iterations per second for 256-bit key
PBKDF2-ripemd160  266677 iterations per second for 256-bit key
PBKDF2-whirlpool  115787 iterations per second for 256-bit key
#  Algorithm | Key |  Encryption |  Decryption
     aes-cbc   128b    46.0 MiB/s    46.7 MiB/s
 serpent-cbc   128b           N/A           N/A
 twofish-cbc   128b           N/A           N/A
     aes-cbc   256b    46.5 MiB/s    46.4 MiB/s
 serpent-cbc   256b           N/A           N/A
 twofish-cbc   256b           N/A           N/A
Segmentation fault

Oops.

ccree e6601000.crypto: Unsupported data size 65536.
Unable to handle kernel paging request at virtual address ffffffbf5c3c3c20
Mem abort info:
  ESR = 0x96000005
  Exception class = DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
Data abort info:
  ISV = 0, ISS = 0x00000005
  CM = 0, WnR = 0
swapper pgtable: 4k pages, 39-bit VAs, pgdp = 000000000ed05706
[ffffffbf5c3c3c20] pgd=0000000000000000, pud=0000000000000000
Internal error: Oops: 96000005 [#1] SMP
Modules linked in:
CPU: 4 PID: 986 Comm: cryptsetup Not tainted
4.18.0-rc5-salvator-x-00429-ge5b9d1fce24c0b6c-dirty #118
Hardware name: Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+ (DT)
pstate: 20400005 (nzCv daif +PAN -UAO)
pc : ksize+0x28/0x48
lr : kzfree+0x1c/0x44
sp : ffffff800bab3a40
x29: ffffff800bab3a40 x28: 00000000ffffffea
x27: 0000000000000000 x26: 0000000000010000
x25: ffffffc6f72e0480 x24: 0000000000000010
x23: ffffffc6fa227810 x22: 0000000000000000
x21: ffffff800900e000 x20: ffffffc6f48a5a80
x19: 5a5a5a5a5a5a5a5a x18: 000000000000000a
x17: 0000000000000000 x16: 0000000000000000
x15: 000000000000bc43 x14: ffffff8089c9aadf
x13: ffffffffffffffff x12: 0000000000000030
x11: 00000000fffffffe x10: ffffff8009c9aae8
x9 : 0000000005f5e0ff x8 : 0000000000000000
x7 : ffffff800814c948 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000000
x3 : 0000000000000000 x2 : 38716e04a5aa3600
x1 : ffffffbf00000000 x0 : ffffffbf5c3c3c18
Process cryptsetup (pid: 986, stack limit = 0x00000000c7b0be1c)
Call trace:
 ksize+0x28/0x48
 cc_cipher_process+0x3d4/0x7cc
 cc_cipher_encrypt+0x18/0x20
 skcipher_recvmsg+0x2e0/0x344
 sock_recvmsg+0x1c/0x24
 sock_read_iter+0x88/0xd8
 __vfs_read+0x108/0x138
 vfs_read+0x8c/0x120
 ksys_read+0x5c/0xbc
 __arm64_sys_read+0x14/0x1c
 el0_svc_common+0x98/0xe8
 el0_svc_handler+0x1c/0x24
 el0_svc+0x8/0xc
Code: 9b017c00 d2dff7e1 f2ffffe1 aa010000 (f9400401)
---[ end trace 546b68143e9ab0cd ]---

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
