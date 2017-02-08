Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33054 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932994AbdBHI6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 03:58:06 -0500
MIME-Version: 1.0
In-Reply-To: <ed0b8422-8ab1-7d8d-318f-343e6e2de17d@jinso.co.jp>
References: <1486342933-5307-1-git-send-email-cv-dong@jinso.co.jp>
 <CAMuHMdUyA9+KLaD9rY9gYjxjZcQ1bWKoDhP25mEAdZTr7E0uwA@mail.gmail.com> <ed0b8422-8ab1-7d8d-318f-343e6e2de17d@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2017 09:58:04 +0100
Message-ID: <CAMuHMdVDgjBF+c-z4=LH+PD00oiNFqhShQuZ0ELS0S4YpQ=npg@mail.gmail.com>
Subject: Re: [PATCH] spi: rspi: fix the bug related to mount/remount jffs2
To: DongCV <cv-dong@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dong,

On Tue, Feb 7, 2017 at 11:25 AM, DongCV <cv-dong@jinso.co.jp> wrote:
>>> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
>>> index 9daf500..2ee1301 100644
>>> --- a/drivers/spi/spi-rspi.c
>>> +++ b/drivers/spi/spi-rspi.c
>>> @@ -848,7 +848,6 @@ static int qspi_transfer_in(struct rspi_data *rspi,
>>> struct spi_transfer *xfer)
>>>                        ret = rspi_pio_transfer(rspi, NULL, rx, n);
>>>                        if (ret < 0)
>>>                                return ret;
>>> -                     *rx++ = ret;
>>
>> Storing the success code (0) in the receive buffer is indeed wrong.
>>
>> However, there are other bugs in that code:
>>
>> rspi_pio_transfer(rspi, NULL, rx, n) transfers n bytes instead of len,
>> while n is decreased by len (which is <= n).
>> Furthermore rx is not incremented.
>> Hence if len < n, n will still be non-zero, and a new iteration of the
>> loop will be started, trying to receive more data, and overwriting the
>> just filled buffer.
>>
>> The same bug is present in qspi_transfer_out().
>>
>>>                }
>>>                n -= len;
>>>        }
>>> --
>>> 1.9.1
>>>
> (nip)
>>
>> Apart from sending patches inline, my comments from
>> https://www.spinics.net/lists/linux-spi/msg09753.html are still valid.
>
>
> Sorry I might not understand your explanation correctly. Could you please
> explain it more details?
> (Because I've tried to understand your explanation then analyzed the source
> code again as below:
> https://patchwork.kernel.org/patch/9541629/)

qspi_transfer_in() does:

        while (n > 0) {
                len = qspi_set_receive_trigger(rspi, n);
                // len will be <= n
                if (len == QSPI_BUFFER_SIZE) {
                        // receive blocks of len bytes
                        ...
                } else {
                        // receive n (not len) bytes
                        ret = rspi_pio_transfer(rspi, NULL, rx, n);
                        //
                        if (ret < 0)
                                return ret;
                        // bogus write (which your patch removes: OK)
                        *rx++ = ret;
                        // here we should also return (see below why)
                        // (in qspi_transfer_out() we should "break")
                }
                // Either we received a block of len bytes
                // or we received n bytes, and the below is wrong if len < n!
                n -= len;
                // If len was < n, n will be non-zero, and we will receive more
                // bytes in the next iteration
        }

        return 0;
}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
