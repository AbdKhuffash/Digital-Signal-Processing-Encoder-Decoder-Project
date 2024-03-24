# Voice-Frequency Encoder and Decoder Project
## Introduction
This project focuses on designing and implementing a system capable of encoding and decoding English text using voice-frequency signals. The project is divided into two distinct phases, each with specific objectives and tasks.

## Phase One: Encoding
In the first phase, the goal is to design and implement an English alphabet character voice-frequency encoder. Each English character is represented by a combination of three voice-band frequency components: low, middle, and high frequencies. The encoding process involves assigning specific frequency components to each character according to predefined tables.

Tasks in Phase One:

1-Implement the Encoder: Develop the algorithm to encode English characters into corresponding voice-frequency signals based on the provided specifications and frequency tables.

2-Build a GUI: Create a user-friendly graphical interface allowing users to input English strings and generate corresponding voice-frequency signals.

3-Signal Options: Provide users with options to either play the generated signal for auditory feedback or save it as a .wav audio file.

## Phase Two: Decoding
The second phase involves designing, implementing, and testing a decoder for the encoded voice-frequency signals generated in Phase One. Two distinct approaches are proposed for decoding: frequency analysis (e.g., Fourier transform) and bandpass filtering. The decoder must accurately recover the original text string from the encoded multi-frequency signal.

Tasks in Phase Two:
1-Implement Decoders: Develop two decoding systems capable of recovering text strings from encoded voice-frequency signals. One system utilizes frequency analysis, while the other employs bandpass filters.

2-GUI for Decoding: Design a user interface enabling users to upload audio files containing encoded signals and convert them into corresponding text strings.

3-Testing and Evaluation: Conduct thorough testing of both decoding systems using a variety of encoded strings with different lengths. Report the accuracy of each system, calculated as the number of correctly recognized letters divided by the string length.

## Additional Resources
For more detailed information and technical specifications, please refer to the project report accompanying this README file.

## Conclusion
This project offers a comprehensive solution for encoding and decoding English text using voice-frequency signals. By following the guidelines provided in this README file and referring to the project report, users can effectively utilize and understand the functionalities of the system.
